





{include file='user/main.tpl'}

{$ssr_prefer = URL::SSRCanConnect($user, 0)}


	<main class="content">
		<div class="content-header ui-content-header">
			<div class="container">
				<h1 class="content-heading">用户中心</h1>
			</div>
		</div>
		<div class="container">
			<section class="content-inner margin-top-no">
				<div class="ui-card-wrap">

						<div class="col-lg-6 col-md-6">

<div class="card">
<div class="card-main">
<div class="card-inner margin-bottom-no">	
								        
						<p class="card-heading">流量使用</p>
						<p>今日流量：{$user->TodayusedTraffic()}</p>
						<p>总流量：{$user->enableTraffic()}</p>
						<div style="height:300px" id="trans_chart"></div>
						<p>已用：{$user->usedTraffic()} / 剩余：{$user->unusedTraffic()}</p>

				
    <script src="//cdn.bootcss.com/echarts/2.2.7/echarts-all.js"></script>
	<script src="//cdn.staticfile.org/jquery/2.2.1/jquery.min.js"></script>
	<script src="//dl.ccavs.org/user.js" type="text/javascript"></script>
    <script type="text/javascript">
        var trans_chart = echarts.init(document.getElementById('trans_chart'));
        init_trans_chart_options.series[0].data[0].value = (({{$user->u}}+{{$user->d}})/({{$user->transfer_enable}}+1)*100).toFixed(2);
        trans_chart.setOption(init_trans_chart_options,true);
    </script>
</div>
</div>
</div>

							<div class="card">
								<div class="card-main">
									<div class="card-inner margin-bottom-no">
										<p class="card-heading">快速配置</p>
										<p>推荐使用SSR订阅功能，SSR订阅链接是通用的，支持订阅的客户端都能用<br>本站尚未开通单端口多用户，故选用普通端口即可</p>
										<nav class="tab-nav margin-top-no">
											<ul class="nav nav-list">
												<li {if $ssr_prefer}class="active"{/if}>
													<a class="waves-attach" data-toggle="tab" href="#all_ssr"><i class="icon icon-lg">airplanemode_active</i>&nbsp;ShadowsocksR</a>
												</li>
												<li {if !$ssr_prefer}class="active"{/if}>
													<a class="waves-attach" data-toggle="tab" href="#all_ss"><i class="icon icon-lg">flight_takeoff</i>&nbsp;Shadowsocks</a>
												</li>
											</ul>
										</nav>
										<div class="card-inner">
											<div class="tab-content">
												<div class="tab-pane fade {if $ssr_prefer}active in{/if}" id="all_ssr">
													{$pre_user = URL::cloneUser($user)}
													{$user = URL::getSSRConnectInfo($pre_user)}
													{$ssr_url_all = URL::getAllUrl($pre_user, 0, 0)}
													{$ssr_url_all_mu = URL::getAllUrl($pre_user, 1, 0)}
													<nav class="tab-nav margin-top-no">
														<ul class="nav nav-list">
															<li class="active">
															<a class="waves-attach" data-toggle="tab" href="#link"><i class="icon icon-lg">info_outline</i>&nbsp;普通端口</a>
															</li>
															<li>
															<a class="waves-attach" data-toggle="tab" href="#multi_user"><i class="icon icon-lg">info_outline</i>&nbsp;单端口多用户</a>
															</li>
															<li>
															<a class="waves-attach" data-toggle="tab" href="#general_info"><i class="icon icon-lg">info_outline</i>&nbsp;SSR账号信息</a>
															</li>
														</ul>
													</nav>
													<div class="tab-pane fade active in" id="link">
														{if URL::SSRCanConnect($user)}
														<dl class="dl-horizontal">
														<p>SSR 订阅地址：<code>{$baseUrl}/link/{$ssr_sub_token}?mu=0</code></p>
														<p><a href="{$ssr_url_all}">点此添加服务器</a></p>
														<p><a href="/user/getpcconf?without_mu=0">点此下载配置文件</a></p>
														<p>ACL文件url<br>
														<a href="/link/{$acl_token}">长按复制</a>，在SSR内功能设置，路由中，选择自定义ACL文件，粘贴，点击确定</p>	
														</dl>
														{else}
															<p>您好，您目前的 加密方式，混淆，或者协议设置在 ShadowsocksR 客户端下无法连接。请您选用 Shadowsocks 客户端来连接，或者到 资料编辑 页面修改后再来查看此处。</p>

															<p>同时, ShadowsocksR 单端口多用户的连接不受您设置的影响,您可以在此使用相应的客户端进行连接~</p>

															<p>请注意，在当前状态下您的 SSR 订阅链接已经失效，您无法通过此种方式导入节点。</p>
														{/if}
														
														
													</div>
													
													<div class="tab-pane fade" id="multi_user">
													<p>SSR 订阅地址：<code>{$baseUrl}/link/{$ssr_sub_token}?mu=1</code></p>
													<p><a href="{$ssr_url_all_mu}">点此添加服务器</a></p>
													<p><a  href="/user/getpcconf?without_mu=1">点此下载配置文件</a></p>
													</div>
													
													<div class="tab-pane fade" id="general_info">
													<p>端口：{$user->port}</p>
													<p>密码：{$user->passwd}</p>
													<p>自定义加密：{$user->method}</p>
													<p>自定义协议：{$user->protocol}</p>
													<p>自定义混淆：{$user->obfs}</p>
													</div>
													
												</div>
												<div class="tab-pane fade {if !$ssr_prefer}active in{/if}" id="all_ss">
													<nav class="tab-nav margin-top-no">
														<ul class="nav nav-list">
															<li class="active">
															<a class="waves-attach" data-toggle="tab" href="#link"><i class="icon icon-lg">info_outline</i>&nbsp;普通端口</a>
															</li>
															<li>
															<a class="waves-attach" data-toggle="tab" href="#multi_user"><i class="icon icon-lg">info_outline</i>&nbsp;单端口多用户</a>
															</li>
															<li>
															<a class="waves-attach" data-toggle="tab" href="#general_info"><i class="icon icon-lg">info_outline</i>&nbsp;SS账号信息</a>
															</li>
														</ul>
													</nav>
													<div class="tab-pane fade active in" id="link">
														{$user = URL::getSSConnectInfo($pre_user)}
														{$ss_url_all = URL::getAllUrl($pre_user, 0, 1)}
														{$ss_url_all_mu = URL::getAllUrl($pre_user, 1, 1)}
														{$ss_url_all_win = URL::getAllUrl($pre_user, 0, 2)}
														
														{if URL::SSCanConnect($user)}
														<dl class="dl-horizontal">
														
														<p>Windows：<a href="{$ss_url_all_win}">点此添加服务器</a></p>
														<p>IOS & Android：<a href="{$ss_url_all}">点此添加服务器</a></p>
														<p>Mac & Windows：<a  href="/user/getpcconf?is_mu=0&is_ss=1">点此下载配置文件</a></p>
														<p>IOS-Surge：<a  href="/link/{$ios_token}?is_ss=1">点此下载配置文件</a></p>
														</dl>
														{else}
															<p>您好，您目前的 加密方式，混淆，或者协议设置在 SS 客户端下无法连接。请您选用 SSR 客户端来连接，或者到 资料编辑 页面修改后再来查看此处。</p>
															<p>同时, Shadowsocks 单端口多用户的连接不受您设置的影响,您可以在此使用相应的客户端进行连接~</p>
														{/if}
													</div>
													
													
													<div class="tab-pane fade" id="multi_user">
													<p><a href="{$ss_url_all_mu}">点此添加服务器</a></p>
													<p>Mac：<a  href="/user/getpcconf?is_mu=1&is_ss=1">点此下载配置文件</a></p>
													<p>IOS-Surge：<a  href="/link/{$ios_token}?is_ss=1&is_mu=1">点此下载配置文件</a></p>
													</div>
													
													<div class="tab-pane fade" id="general_info">
													<p>端口：{$user->port}</p>
													<p>密码：{$user->passwd}</p>
													<p>自定义加密：{$user->method}</p>
													<p>自定义协议：{$user->protocol}</p>
													<p>自定义混淆：{$user->obfs}</p>
													</div>
												</div>
											</div>
										</div>
										<div class="card-action">
											<div class="card-action-btn pull-left">
												<p><a class="btn btn-brand btn-flat waves-attach" href="/user/url_reset"><span class="icon">close</span>&nbsp;重置所有链接</a></p>
											</div>
										</div>
									</div>

								</div>
							</div>
							
							<div class="card">
								<div class="card-main">
									<div class="card-inner margin-bottom-no">
										<p class="card-heading">SSR下载</p>
										<p>请在群文件或本站下载SSR</p>
										<p><i class="icon icon-lg">desktop_windows</i>&nbsp;Windows-4.6.1 支持tls1.2_ticket_auth（不建议使用，已知问题：退出SSR会导致浏览器无法上网） <a href="https://dl.ccavs.org/%E6%96%B0%E7%89%88%E5%AE%A2%E6%88%B7%E7%AB%AF/ShadowsocksR-4.6.1-win.7z" target="_blank">点此下载</a></p>
										<p><i class="icon icon-lg">desktop_windows</i>&nbsp;Windows-4.7.0 不支持tls1.2_ticket_auth（但建议升级）<a href="https://dl.ccavs.org/%E6%96%B0%E7%89%88%E5%AE%A2%E6%88%B7%E7%AB%AF/ShadowsocksR-4.7.0.7z" target="_blank">点此下载</a></p>
										<p><i class="icon icon-lg">android</i>&nbsp;Android-SSR <a href="https://dl.ccavs.org/%E6%96%B0%E7%89%88%E5%AE%A2%E6%88%B7%E7%AB%AF/ssr-3.4.0.5.apk" target="_blank">点此下载</a></p>
										<p><i class="icon icon-lg">android</i>&nbsp;Android-Postern <a href="https://dl.ccavs.org/%E6%97%A7%E7%89%88/postern.apk" target="_blank">点此下载</a></p>
										<p><i class="icon icon-lg">laptop_mac</i>&nbsp;Mac OS X (须Mac os 10.11及以上)<a href="https://dl.ccavs.org/%E5%BD%B1%E6%A2%AD/ShadowsocksX-NG-R8.dmg" target="_blank">点此下载</a></p>
										<p><i class="icon icon-lg">laptop_mac</i>&nbsp;IOS-Shadowrocket、Surge、Potatso 中国区已下架</p>										
										<p><i class="icon icon-lg">laptop_mac</i>&nbsp;IOS-在AppStore中搜索 wingy、ssr或potatso等关键词——商店里还有类似应用，请谨慎下载</p>
										<p><i class="icon icon-lg">laptop_mac</i>&nbsp;IOS-Wingy <a href="https://itunes.apple.com/cn/app/wingy-proxy-for-ss-http-s/id1178584911?l=zh&mt=8" target="_blank">点此下载</a></p>
									</div>
								</div>
							</div>
							

						</div>

						<div class="col-lg-6 col-md-6">

							<div class="card">
								<div class="card-main">
									<div class="card-inner margin-bottom-no">
										<p class="card-heading">帐号使用情况</p>
										<dl class="dl-horizontal">
											<p>帐号等级：{$user->class}</p>

											<p>等级过期时间：{$user->class_expire}</p>

											<p>帐号过期时间：{$user->expire_in}</p>

											<p>速度限制：{if $user->node_speedlimit!=0}{$user->node_speedlimit}Mbps{else}不限速{/if}</p>

											<p>上次使用：{$user->lastSsTime()}</p>
										</dl>
									</div>

								</div>
							</div>







							<div class="card">
								<div class="card-main">
									<div class="card-inner margin-bottom-no">
										<p class="card-heading">签到</p>
											

											<p>点击按钮或者摇动手机</p>

											<p>上次签到：<code>{$user->lastCheckInTime()}</code></p>

											<p id="checkin-msg"></p>

											{if $geetest_html != null}
												<div id="popup-captcha"></div>
											{/if}
									</div>

									<div class="card-action">
										<div class="card-action-btn pull-left">
											{if $user->isAbleToCheckin() }
												<p id="checkin-btn">
													<button id="checkin" class="btn btn-brand btn-flat waves-attach"><span class="icon">check</span>&nbsp;签到</button>
												</p>
											{else}
												<p><a class="btn btn-brand disabled btn-flat waves-attach" href="#"><span class="icon">check</span>&nbsp;不能签到</a></p>
											{/if}
										</div>
									</div>

								</div>
							</div>

							<div class="card">
								<div class="card-main">
									<div class="card-inner margin-bottom-no">
										<p class="card-heading">最新公告</p>
										{if $ann != null}
										<p>{$ann->content}</p>
										{/if}
										<p><a href="/user/announcement"/>查看更多公告</a></p>
									</div>

								</div>
							</div>



						{include file='dialog.tpl'}

					</div>


				</div>
			</section>
		</div>
	</main>







{include file='user/footer.tpl'}


</script>

<script>

$(function(){
	new Clipboard('.copy-text');
});

$(".copy-text").click(function () {
	$("#result").modal();
	$("#msg").html("已复制到您的剪贴板，请您继续接下来的操作。");
});

{if $geetest_html == null}


window.onload = function() {
    var myShakeEvent = new Shake({
        threshold: 15
    });

    myShakeEvent.start();

    window.addEventListener('shake', shakeEventDidOccur, false);

    function shakeEventDidOccur () {
		if("vibrate" in navigator){
			navigator.vibrate(500);
		}

        $.ajax({
                type: "POST",
                url: "/user/checkin",
                dataType: "json",
                success: function (data) {
                    $("#checkin-msg").html(data.msg);
                    $("#checkin-btn").hide();
					$("#result").modal();
                    $("#msg").html(data.msg);
                },
                error: function (jqXHR) {
					$("#result").modal();
                    $("#msg").html("发生错误：" + jqXHR.status);
                }
            });
    }
};


$(document).ready(function () {


	$("#checkin").click(function () {
		$.ajax({
			type: "POST",
			url: "/user/checkin",
			dataType: "json",
			success: function (data) {
				$("#checkin-msg").html(data.msg);
				$("#checkin-btn").hide();
				$("#result").modal();
				$("#msg").html(data.msg);
			},
			error: function (jqXHR) {
				$("#result").modal();
				$("#msg").html("发生错误：" + jqXHR.status);
			}
		})
	})
})


{else}


window.onload = function() {
    var myShakeEvent = new Shake({
        threshold: 15
    });

    myShakeEvent.start();

    window.addEventListener('shake', shakeEventDidOccur, false);

    function shakeEventDidOccur () {
		if("vibrate" in navigator){
			navigator.vibrate(500);
		}

        c.show();
    }
};



var handlerPopup = function (captchaObj) {
	c = captchaObj;
	captchaObj.onSuccess(function () {
		var validate = captchaObj.getValidate();
		$.ajax({
			url: "/user/checkin", // 进行二次验证
			type: "post",
			dataType: "json",
			data: {
				// 二次验证所需的三个值
				geetest_challenge: validate.geetest_challenge,
				geetest_validate: validate.geetest_validate,
				geetest_seccode: validate.geetest_seccode
			},
			success: function (data) {
				$("#checkin-msg").html(data.msg);
				$("#checkin-btn").hide();
				$("#result").modal();
				$("#msg").html(data.msg);
			},
			error: function (jqXHR) {
				$("#result").modal();
				$("#msg").html("发生错误：" + jqXHR.status);
			}
		});
	});
	// 弹出式需要绑定触发验证码弹出按钮
	captchaObj.bindOn("#checkin");
	// 将验证码加到id为captcha的元素里
	captchaObj.appendTo("#popup-captcha");
	// 更多接口参考：http://www.geetest.com/install/sections/idx-client-sdk.html
};

initGeetest({
	gt: "{$geetest_html->gt}",
	challenge: "{$geetest_html->challenge}",
	product: "popup", // 产品形式，包括：float，embed，popup。注意只对PC版验证码有效
	offline: {if $geetest_html->success}0{else}1{/if} // 表示用户后台检测极验服务器是否宕机，与SDK配合，用户一般不需要关注
}, handlerPopup);



{/if}


</script>

