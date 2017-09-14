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
									<p>今日签到：<p/>
									<p>{$sts->getTodayCheckinUser()}人<p/>
										
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
									
										<div id="node_chart" style="height: 300px; width: 100%;"></div>
										
										<script src="//cdn.staticfile.org/canvasjs/1.7.0/canvasjs.js"></script>
										<script type="text/javascript">
											var chart = new CanvasJS.Chart("node_chart",
											{
												title:{
													text: "节点在线情况(节点数 {$sts->getTotalSSNode()}个)",
													fontFamily: "Impact",
													fontWeight: "normal"
												},

												legend:{
													verticalAlign: "bottom",
													horizontalAlign: "center"
												},
												data: [
												{
													//startAngle: 45,
													indexLabelFontSize: 20,
													indexLabelFontFamily: "Garamond",
													indexLabelFontColor: "darkgrey",
													indexLabelLineColor: "darkgrey",
													indexLabelPlacement: "outside",
													type: "doughnut",
													showInLegend: true,
													dataPoints: [
														{if $sts->getTotalSSNode()!=0}
															{
																y: {(1-($sts->getAliveSSNode()/$sts->getTotalSSNode()))*100}, legendText:"离线节点 {number_format((1-($sts->getAliveSSNode()/$sts->getTotalSSNode()))*100,2)}% {$sts->getTotalSSNode()-$sts->getAliveSSNode()}个", indexLabel: "离线节点 {number_format((1-($sts->getAliveSSNode()/$sts->getTotalSSNode()))*100,2)}% {$sts->getTotalSSNode()-$sts->getAliveSSNode()}个"
															},
															{
																y: {(($sts->getAliveSSNode()/$sts->getTotalSSNode()))*100}, legendText:"在线节点 {number_format((($sts->getAliveSSNode()/$sts->getTotalSSNode()))*100,2)}% {$sts->getAliveSSNode()}个", indexLabel: "在线节点 {number_format((($sts->getAliveSSNode()/$sts->getTotalSSNode()))*100,2)}% {$sts->getAliveSSNode()}个"
															}
														{/if}
													]
												}
												]
											});

											chart.render();
										</script>
										
									</div>
									
								</div>
							</div>
							
							
							<div class="card">
								<div class="card-main">
									<div class="card-inner margin-bottom-no">
									
										<div id="traffic_chart" style="height: 300px; width: 100%;"></div>
										
										<script src="//cdn.staticfile.org/canvasjs/1.7.0/canvasjs.js"></script>
										<script type="text/javascript">
											var chart = new CanvasJS.Chart("traffic_chart",
											{
												title:{
													text: "流量使用情况(总分配流量 {$sts->getTotalTraffic()})",
													fontFamily: "Impact",
													fontWeight: "normal"
												},

												legend:{
													verticalAlign: "bottom",
													horizontalAlign: "center"
												},
												data: [
												{
													//startAngle: 45,
													indexLabelFontSize: 20,
													indexLabelFontFamily: "Garamond",
													indexLabelFontColor: "darkgrey",
													indexLabelLineColor: "darkgrey",
													indexLabelPlacement: "outside",
													type: "doughnut",
													showInLegend: true,
													dataPoints: [
														{if $sts->getRawTotalTraffic()!=0}
															{
																y: {(($sts->getRawUnusedTrafficUsage()/$sts->getRawTotalTraffic()))*100}, legendText:"未使用的流量 {number_format((($sts->getRawUnusedTrafficUsage()/$sts->getRawTotalTraffic()))*100,2)}% {(($sts->getUnusedTrafficUsage()))}", indexLabel: "未使用的流量 {number_format((($sts->getRawUnusedTrafficUsage()/$sts->getRawTotalTraffic()))*100,2)}% {(($sts->getUnusedTrafficUsage()))}"
															},
															{
																y: {(($sts->getRawLastTrafficUsage()/$sts->getRawTotalTraffic()))*100}, legendText:"已使用的流量 {number_format((($sts->getRawLastTrafficUsage()/$sts->getRawTotalTraffic()))*100,2)}% {(($sts->getLastTrafficUsage()))}", indexLabel: "已使用的流量 {number_format((($sts->getRawLastTrafficUsage()/$sts->getRawTotalTraffic()))*100,2)}% {(($sts->getLastTrafficUsage()))}"
															},
															{
																y: {(($sts->getRawTodayTrafficUsage()/$sts->getRawTotalTraffic()))*100}, legendText:"今日使用的流量 {number_format((($sts->getRawTodayTrafficUsage()/$sts->getRawTotalTraffic()))*100,2)}% {(($sts->getTodayTrafficUsage()))}", indexLabel: "今日使用的流量 {number_format((($sts->getRawTodayTrafficUsage()/$sts->getRawTotalTraffic()))*100,2)}% {(($sts->getTodayTrafficUsage()))}"
															}
														{/if}
													]
												}
												]
											});

											chart.render();
										</script>
										
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
