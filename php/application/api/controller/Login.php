<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/10/20
 * Time: 10:27
 */

namespace app\api\controller;

use think\Db;
use think\Validate;
use util\HttpClient;
use wxapp\WXBizDataCrypt;

class Login extends BaseController
{
    /**
     * 小程序登录接口
     */
    public function login()
    {
        $validate = new Validate([
            'code'              => 'required',
            'encrypted_data'    => 'required',
            'iv'                => 'required',
            'raw_data'          => 'required',
            'singature'         => 'required'
        ]);

        $validate->message([
            'code.require'           => '缺少参数code!',
            'encrypted_data.require' => '缺少参数encrypted_data!',
            'iv.require'             => '缺少参数iv!',
            'raw_data.require'       => '缺少参数raw_data!',
            'signature.require'      => '缺少参数signature!',
        ]);

        $data = $this->request->param();
        if (!$validate->check($data)) {
            $this->error($validate->getError());
        }

        //code换取session_key
        $code = $data['code'];
        $appid = Config('wxapp.appid');
        $appsecret = Config('wxapp.appsecret');
        $url = 'https://api.weixin.qq.com/sns/jscode2session?appid='.$appid.'&secret='.$appsecret.'&js_code='.$code.'&grant_type=authorization_code';

        $response = HttpClient::curl_get($url);
        $response = json_decode($response, true);

        if (!$response) {
            $this->error('操作失败');
        }

        $openid = $response['openid'];
        $sessionKey = $response['session_key'];

        $pc = new WXBizDataCrypt($sessionKey);
        $errCode = $pc->decryptData($data['encrypted_data'], $data['iv'], $wxUserData);

        if ($errCode != 0) {
            $this->error('操作失败');
        }

        $ip = $this->request->ip(0, true);
        $currentTime = time();


        $user = Db::name('user')
            ->where('open_id',$openid)
            ->find();
        if (!empty($user)) {
            $token = generate_user_token($user['id'],'wxapp');

            $userData = [
                'last_login_ip'     => $ip,
                'last_login_time'   => $currentTime,
            ];

            Db::name('user')
                ->where('open_id', $openid)
                ->update($userData);
        } else {
            $userData = [
                'open_id'           => $wxUserData['openId'],
                'union_id'          => isset($wxUserData['unionId']) ? $wxUserData['unionId'] : '',
                'nickname'          => $wxUserData['nickName'],
                'avatar_url'        => $wxUserData['avatar_url'],
                'sex'               => $wxUserData['gender'],
                'last_login_ip'     => $ip,
                'last_login_time'   => $currentTime
            ];
            $userId = Db::name('user')
                ->insertGetId($userData);
            $token= generate_user_token($userId, 'wxapp');
        }
        $this->success('登录成功', $token);

    }
}