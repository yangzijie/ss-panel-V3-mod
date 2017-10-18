{include file='admin/main.tpl'}







	<main class="content">
		<div class="content-header ui-content-header">
			<div class="container">
				<h1 class="content-heading">汇总</h1>
			</div>
		</div>
		<div class="container">
			<section class="content-inner margin-top-no">

				<div class="ui-card-wrap">
					<div class="row">
					
						<div class="col-lg-6 col-sm-6">
						
						
							<div class="card">
								<div class="card-main">
									<div class="card-inner margin-bottom-no">
									<p>用户总数：{$sts->getTotalUser()}人<p/>
									<p>200G套餐：{$sts->getShop1User()}人<p/>
									<p>等级为1：{$sts->getClass1User()}人<p/>
									<p>等级为0：{$sts->getClass0User()}人<p/>
									</div>
									
								</div>
							</div>
							
							
							<div class="card">
								<div class="card-main">
									<div class="card-inner margin-bottom-no">
								
										<p>在线人数</p>
										<p>一天内：{($sts->getOnlineUser(86400)-$sts->getOnlineUser(3600))}人</p>
										<p>一小时内：{($sts->getOnlineUser(3600)-$sts->getOnlineUser(60))}人</p>
										<p>一分钟内：{($sts->getOnlineUser(60))}人</p>
										
									</div>
									
								</div>
							</div>
						
						
						</div>
						
						
						<div class="col-lg-6 col-sm-6">
						
						
							<div class="card">
								<div class="card-main">
									<div class="card-inner margin-bottom-no">
									
										<p>在线节点：{$sts->getAliveSSNode()}个</p>
										<p>离线节点：{$sts->getTotalSSNode()-$sts->getAliveSSNode()}个</p>
										
									</div>
									
								</div>
							</div>
							
							
							<div class="card">
								<div class="card-main">
									<div class="card-inner margin-bottom-no">
									
										<p>已用流量：{(($sts->getLastTrafficUsage()))}</p>
										<p>今日流量：{(($sts->getTodayTrafficUsage()))}</p>
										
										
									</div>
									
								</div>
							</div>
						
						
						</div>
						
						<div class="col-lg-6 col-sm-6">

						<div class="card">
						<div class="card-main">
						<div class="card-inner margin-bottom-no">
							<p>各服务器流量</p>
							{foreach $nodes as $node}

<script>
var traffic = {($node->node_bandwidth-$node->node_last_day_t)/$node->traffic_rate}

if ( traffic < 1048576 )
{
    document.write("{$node->name} ");
    document.write((traffic/1024).toFixed(3));
    document.write("kb"); 
}

else if ( traffic < 1073741824 )
{
    document.write("{$node->name} ");
    document.write((traffic/1048576).toFixed(3));
    document.write("M"); 
}

else if ( traffic < 1099511627776 )
{
    document.write("{$node->name} ");
    document.write((traffic/1073741824).toFixed(3));
    document.write("G"); 
}

else if ( traffic > 1099511627776)
{
    document.write("{$node->name} "); 
    document.write((traffic/1099511627776).toFixed(3));
    document.write("T");

}
</script>
<br />

							{/foreach}
						</div>
						</div>
						</div>
						
						</div>
						
					</div>
				</div>
			</section>
		</div>
	</main>














{include file='admin/footer.tpl'}
