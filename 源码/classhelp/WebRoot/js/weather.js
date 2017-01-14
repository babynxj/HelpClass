/**
 * 高德天气js
 */
var map = new AMap.Map('container', {
	resizeEnable : true,
	zoom : 12
});
AMap.service('AMap.Weather', function() {
	var weather = new AMap.Weather();
	// 查询实时天气信息, 查询的城市到行政级别的城市，如朝阳区、杭州市
	weather.getLive('芝罘区', function(err, data) {
		if (!err) {
			var str = [];
			str.push('<div style="color: #3366FF;">发布时间：' + data.reportTime
					+ '</div>');
			str.push('<div>城市/区：' + data.city + '</div>');
			str.push('<div>天气：' + data.weather + '</div>');
			str.push('<div>温度：' + data.temperature + '℃</div>');
			str.push('<div>风向：' + data.windDirection + '</div>');
			str.push('<div>风力：' + data.windPower + ' 级</div>');
			document.getElementById('tip').innerHTML = str.join('');
		}
	});
});