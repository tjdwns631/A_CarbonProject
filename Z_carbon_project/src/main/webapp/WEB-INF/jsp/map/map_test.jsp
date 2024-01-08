<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/ol@v8.1.0/dist/ol.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/ol@v8.1.0/ol.css">
</head>
<body>
	<h1>맵 맵 맵 맵 맵 맵</h1>
	<div id="map" class="map" tabindex="0" style="height: 600px; width: 100%"></div>
	<div id="info"></div>
	<script>
		const geoJson = {
				  "type": "FeatureCollection",
				  "features": [
				    {
				      "type": "Feature",
				      "geometry": {
				        "type": "Polygon",
				        "coordinates": [ [ [ 127.1063733, 37.4640793, 0.0 ],
							[ 127.1063833, 37.4641394, 0.0 ],
							[ 127.1064778, 37.464681, 0.0 ],
							[ 127.1047184, 37.464804, 0.0 ],
							[ 127.1044987, 37.4648193, 0.0 ],
							[ 127.1037383, 37.4648909, 0.0 ],
							[ 127.1029872, 37.4649399, 0.0 ],
							[ 127.1026356, 37.4649628, 0.0 ],
							[ 127.10166, 37.4650265, 0.0 ],
							[ 127.1006197, 37.465108, 0.0 ],
							[ 127.1005497, 37.4651136, 0.0 ],
							[ 127.1005075, 37.4651169, 0.0 ],
							[ 127.1004826, 37.4651194, 0.0 ],
							[ 127.0996025, 37.4652087, 0.0 ],
							[ 127.0995163, 37.4652174, 0.0 ],
							[ 127.0995566, 37.4651815, 0.0 ],
							[ 127.0995902, 37.4650503, 0.0 ],
							[ 127.0996391, 37.4649353, 0.0 ],
							[ 127.0996492, 37.4648481, 0.0 ],
							[ 127.0996378, 37.4647666, 0.0 ],
							[ 127.0995942, 37.4645815, 0.0 ],
							[ 127.0997194, 37.4643419, 0.0 ],
							[ 127.0997588, 37.4642833, 0.0 ],
							[ 127.0998869, 37.4640891, 0.0 ],
							[ 127.0999187, 37.4640408, 0.0 ],
							[ 127.099968, 37.4639661, 0.0 ],
							[ 127.100238, 37.4637608, 0.0 ],
							[ 127.1002862, 37.4635808, 0.0 ],
							[ 127.100413, 37.4632244, 0.0 ],
							[ 127.100717, 37.4628659, 0.0 ],
							[ 127.1010823, 37.4625112, 0.0 ],
							[ 127.1011359, 37.4623895, 0.0 ],
							[ 127.1011282, 37.4623793, 0.0 ],
							[ 127.1011405, 37.4623342, 0.0 ],
							[ 127.10111, 37.4623069, 0.0 ],
							[ 127.101091, 37.4622772, 0.0 ],
							[ 127.1010568, 37.4622081, 0.0 ],
							[ 127.1010621, 37.4621719, 0.0 ],
							[ 127.1010357, 37.4621446, 0.0 ],
							[ 127.1010185, 37.4621271, 0.0 ],
							[ 127.1009859, 37.4621228, 0.0 ],
							[ 127.1009717, 37.4621031, 0.0 ],
							[ 127.1009725, 37.4620688, 0.0 ],
							[ 127.101006, 37.4620237, 0.0 ],
							[ 127.1010133, 37.4619893, 0.0 ],
							[ 127.101021, 37.4619745, 0.0 ],
							[ 127.1010378, 37.4619419, 0.0 ],
							[ 127.1010406, 37.461939, 0.0 ],
							[ 127.1010821, 37.4618966, 0.0 ],
							[ 127.1011887, 37.4618516, 0.0 ],
							[ 127.1012469, 37.4618361, 0.0 ],
							[ 127.1012522, 37.4618358, 0.0 ],
							[ 127.1013267, 37.4618279, 0.0 ],
							[ 127.1013299, 37.4617598, 0.0 ],
							[ 127.1013435, 37.4617261, 0.0 ],
							[ 127.1013516, 37.4616894, 0.0 ],
							[ 127.1013678, 37.4616447, 0.0 ],
							[ 127.1013689, 37.4615936, 0.0 ],
							[ 127.1013776, 37.4615446, 0.0 ],
							[ 127.1014264, 37.4614878, 0.0 ],
							[ 127.1013141, 37.4613057, 0.0 ],
							[ 127.1012766, 37.461283, 0.0 ],
							[ 127.1012668, 37.4612785, 0.0 ],
							[ 127.1011796, 37.4612724, 0.0 ],
							[ 127.1010823, 37.4612335, 0.0 ],
							[ 127.1008972, 37.4611763, 0.0 ],
							[ 127.1007006, 37.4611592, 0.0 ],
							[ 127.1004587, 37.4611275, 0.0 ],
							[ 127.0995616, 37.460774, 0.0 ],
							[ 127.0993922, 37.4605753, 0.0 ],
							[ 127.0993402, 37.460487, 0.0 ],
							[ 127.0993505, 37.4602831, 0.0 ],
							[ 127.0994026, 37.4601428, 0.0 ],
							[ 127.0995651, 37.4599418, 0.0 ],
							[ 127.0996856, 37.4598223, 0.0 ],
							[ 127.0997964, 37.4597234, 0.0 ],
							[ 127.0999333, 37.4596142, 0.0 ],
							[ 127.100106, 37.4595595, 0.0 ],
							[ 127.1003036, 37.4595856, 0.0 ],
							[ 127.1003149, 37.4595794, 0.0 ],
							[ 127.1003386, 37.4595663, 0.0 ],
							[ 127.1010049, 37.4591995, 0.0 ],
							[ 127.1013932, 37.4589725, 0.0 ],
							[ 127.1016008, 37.4590387, 0.0 ],
							[ 127.1018291, 37.4591827, 0.0 ],
							[ 127.1019657, 37.4593498, 0.0 ],
							[ 127.1021106, 37.4594236, 0.0 ],
							[ 127.1021445, 37.4594393, 0.0 ],
							[ 127.1022708, 37.459521, 0.0 ],
							[ 127.1022995, 37.4595387, 0.0 ],
							[ 127.102646, 37.4598674, 0.0 ],
							[ 127.1026827, 37.4597781, 0.0 ],
							[ 127.1027003, 37.4597329, 0.0 ],
							[ 127.1028087, 37.4597254, 0.0 ],
							[ 127.1029542, 37.4597325, 0.0 ],
							[ 127.103073, 37.4597611, 0.0 ],
							[ 127.1031674, 37.459766, 0.0 ],
							[ 127.1032543, 37.4597701, 0.0 ],
							[ 127.1034514, 37.4597574, 0.0 ],
							[ 127.1035588, 37.4598353, 0.0 ],
							[ 127.1036495, 37.4598677, 0.0 ],
							[ 127.1038207, 37.459932, 0.0 ],
							[ 127.1038999, 37.4600065, 0.0 ],
							[ 127.1039547, 37.4600568, 0.0 ],
							[ 127.1039812, 37.4601836, 0.0 ],
							[ 127.1039864, 37.4602315, 0.0 ],
							[ 127.1039861, 37.4602688, 0.0 ],
							[ 127.1039978, 37.4602688, 0.0 ],
							[ 127.1039919, 37.4604538, 0.0 ],
							[ 127.1040353, 37.4605576, 0.0 ],
							[ 127.1040582, 37.4605856, 0.0 ],
							[ 127.1041827, 37.4607269, 0.0 ],
							[ 127.1042611, 37.460802, 0.0 ],
							[ 127.1043109, 37.4608172, 0.0 ],
							[ 127.1044202, 37.4609565, 0.0 ],
							[ 127.1044388, 37.460985, 0.0 ],
							[ 127.1044841, 37.4610294, 0.0 ],
							[ 127.1045325, 37.4610566, 0.0 ],
							[ 127.1046371, 37.4610998, 0.0 ],
							[ 127.1047922, 37.46116, 0.0 ],
							[ 127.1047616, 37.4612636, 0.0 ],
							[ 127.1046237, 37.4614448, 0.0 ],
							[ 127.1045623, 37.4616124, 0.0 ],
							[ 127.1045229, 37.4616837, 0.0 ],
							[ 127.1044829, 37.4617559, 0.0 ],
							[ 127.104477, 37.4617746, 0.0 ],
							[ 127.104353, 37.4621748, 0.0 ],
							[ 127.104717, 37.4621546, 0.0 ],
							[ 127.1048787, 37.4621611, 0.0 ],
							[ 127.1049343, 37.4621545, 0.0 ],
							[ 127.1050422, 37.4621417, 0.0 ],
							[ 127.1051403, 37.4621462, 0.0 ],
							[ 127.1052828, 37.4621705, 0.0 ],
							[ 127.10562, 37.4621785, 0.0 ],
							[ 127.105668, 37.4622361, 0.0 ],
							[ 127.1059373, 37.4623546, 0.0 ],
							[ 127.1061539, 37.4624013, 0.0 ],
							[ 127.1061791, 37.4624068, 0.0 ],
							[ 127.1063594, 37.4624174, 0.0 ],
							[ 127.106479, 37.4624244, 0.0 ],
							[ 127.1066839, 37.462411, 0.0 ],
							[ 127.1068918, 37.46237, 0.0 ],
							[ 127.1071967, 37.4622332, 0.0 ],
							[ 127.1073135, 37.4621808, 0.0 ],
							[ 127.1074382, 37.4621858, 0.0 ],
							[ 127.1075262, 37.4621894, 0.0 ],
							[ 127.1077909, 37.4622245, 0.0 ],
							[ 127.1078208, 37.4624344, 0.0 ],
							[ 127.1078376, 37.4624651, 0.0 ],
							[ 127.1076816, 37.4625014, 0.0 ],
							[ 127.1074559, 37.4625457, 0.0 ],
							[ 127.1074139, 37.4625539, 0.0 ],
							[ 127.1074334, 37.4626746, 0.0 ],
							[ 127.1074223, 37.4626756, 0.0 ],
							[ 127.107347, 37.4626816, 0.0 ],
							[ 127.1071586, 37.4626968, 0.0 ],
							[ 127.1069913, 37.4627112, 0.0 ],
							[ 127.1069498, 37.4627147, 0.0 ],
							[ 127.1067477, 37.4627298, 0.0 ],
							[ 127.1067228, 37.4627336, 0.0 ],
							[ 127.1066783, 37.4627404, 0.0 ],
							[ 127.1066767, 37.4627406, 0.0 ],
							[ 127.1064691, 37.4627552, 0.0 ],
							[ 127.1064221, 37.4627602, 0.0 ],
							[ 127.1062607, 37.4627751, 0.0 ],
							[ 127.1061922, 37.4627809, 0.0 ],
							[ 127.1060057, 37.4627942, 0.0 ],
							[ 127.1059456, 37.462799, 0.0 ],
							[ 127.105826, 37.4628083, 0.0 ],
							[ 127.1058291, 37.4628309, 0.0 ],
							[ 127.1058298, 37.4628366, 0.0 ],
							[ 127.1058516, 37.4629966, 0.0 ],
							[ 127.1058023, 37.4630001, 0.0 ],
							[ 127.1054841, 37.4630227, 0.0 ],
							[ 127.1054475, 37.4630262, 0.0 ],
							[ 127.1053363, 37.4630338, 0.0 ],
							[ 127.1053006, 37.4630167, 0.0 ],
							[ 127.1052331, 37.4630225, 0.0 ],
							[ 127.1053323, 37.4637225, 0.0 ],
							[ 127.1053377, 37.46376, 0.0 ],
							[ 127.1053425, 37.4637941, 0.0 ],
							[ 127.1053602, 37.4637983, 0.0 ],
							[ 127.1053776, 37.4638025, 0.0 ],
							[ 127.1053942, 37.463971, 0.0 ],
							[ 127.1054661, 37.4639647, 0.0 ],
							[ 127.1054919, 37.4639616, 0.0 ],
							[ 127.1055527, 37.4639557, 0.0 ],
							[ 127.1057135, 37.463944, 0.0 ],
							[ 127.1058477, 37.4639327, 0.0 ],
							[ 127.1061737, 37.4639029, 0.0 ],
							[ 127.1063419, 37.4638908, 0.0 ],
							[ 127.1063486, 37.4639312, 0.0 ],
							[ 127.1063733, 37.4640793, 0.0 ] ] ]
				      },
				      "properties": {
				        "prop0": "value0",
				        "zoneName": "서울세곡 국민임대주택단지 예정지구"
				      }
				    },
				    {
				      "type": "Feature",
				      "geometry": {
				        "type": "LineString",
				        "coordinates": [
				          [102.0, 0.0], [103.0, 1.0], [104.0, 0.0], [105.0, 1.0]
				        ]
				      },
				      "properties": {
				        "prop0": "value0",
				        "prop1": 0.0,
				        "zoneName": "라인스트링링"
				      }
				    },
				    {
				      "type": "Feature",
				      "geometry": {
				        "type": "Polygon",
				        "coordinates":  [ [ [ 129.1063733, 37.4640793, 0.0 ],
							[ 129.1063833, 37.4641394, 0.0 ],
							[ 129.1064778, 37.464681, 0.0 ],
							[ 129.1047184, 37.464804, 0.0 ],
							[ 129.1044987, 37.4648193, 0.0 ],
							[ 129.1037383, 37.4648909, 0.0 ],
							[ 129.1029872, 37.4649399, 0.0 ],
							[ 129.1026356, 37.4649628, 0.0 ],
							[ 129.10166, 37.4650265, 0.0 ],
							[ 129.1006197, 37.465108, 0.0 ],
							[ 129.1005497, 37.4651136, 0.0 ],
							[ 129.1005075, 37.4651169, 0.0 ],
							[ 129.1004826, 37.4651194, 0.0 ],
							[ 129.0996025, 37.4652087, 0.0 ],
							[ 129.0995163, 37.4652174, 0.0 ],
							[ 129.0995566, 37.4651815, 0.0 ],
							[ 129.0995902, 37.4650503, 0.0 ],
							[ 129.0996391, 37.4649353, 0.0 ],
							[ 129.0996492, 37.4648481, 0.0 ],
							[ 129.0996378, 37.4647666, 0.0 ],
							[ 129.0995942, 37.4645815, 0.0 ],
							[ 129.0997194, 37.4643419, 0.0 ],
							[ 129.0997588, 37.4642833, 0.0 ],
							[ 129.0998869, 37.4640891, 0.0 ],
							[ 129.0999187, 37.4640408, 0.0 ],
							[ 129.099968, 37.4639661, 0.0 ],
							[ 129.100238, 37.4637608, 0.0 ],
							[ 129.1002862, 37.4635808, 0.0 ],
							[ 129.100413, 37.4632244, 0.0 ],
							[ 129.100717, 37.4628659, 0.0 ],
							[ 129.1010823, 37.4625112, 0.0 ],
							[ 129.1011359, 37.4623895, 0.0 ],
							[ 129.1011282, 37.4623793, 0.0 ],
							[ 129.1011405, 37.4623342, 0.0 ],
							[ 129.10111, 37.4623069, 0.0 ],
							[ 129.101091, 37.4622772, 0.0 ],
							[ 129.1010568, 37.4622081, 0.0 ],
							[ 129.1010621, 37.4621719, 0.0 ],
							[ 129.1010357, 37.4621446, 0.0 ],
							[ 129.1010185, 37.4621271, 0.0 ],
							[ 129.1009859, 37.4621228, 0.0 ],
							[ 129.1009717, 37.4621031, 0.0 ],
							[ 129.1009725, 37.4620688, 0.0 ],
							[ 129.101006, 37.4620237, 0.0 ],
							[ 129.1010133, 37.4619893, 0.0 ],
							[ 129.101021, 37.4619745, 0.0 ],
							[ 129.1010378, 37.4619419, 0.0 ],
							[ 129.1010406, 37.461939, 0.0 ],
							[ 129.1010821, 37.4618966, 0.0 ],
							[ 129.1011887, 37.4618516, 0.0 ],
							[ 129.1012469, 37.4618361, 0.0 ],
							[ 129.1012522, 37.4618358, 0.0 ],
							[ 129.1013267, 37.4618279, 0.0 ],
							[ 129.1013299, 37.4617598, 0.0 ],
							[ 129.1013435, 37.4617261, 0.0 ],
							[ 129.1013516, 37.4616894, 0.0 ],
							[ 129.1013678, 37.4616447, 0.0 ],
							[ 129.1013689, 37.4615936, 0.0 ],
							[ 129.1013776, 37.4615446, 0.0 ],
							[ 129.1014264, 37.4614878, 0.0 ],
							[ 129.1013141, 37.4613057, 0.0 ],
							[ 129.1012766, 37.461283, 0.0 ],
							[ 129.1012668, 37.4612785, 0.0 ],
							[ 129.1011796, 37.4612724, 0.0 ],
							[ 129.1010823, 37.4612335, 0.0 ],
							[ 129.1008972, 37.4611763, 0.0 ],
							[ 129.1007006, 37.4611592, 0.0 ],
							[ 129.1004587, 37.4611275, 0.0 ],
							[ 129.0995616, 37.460774, 0.0 ],
							[ 129.0993922, 37.4605753, 0.0 ],
							[ 129.0993402, 37.460487, 0.0 ],
							[ 129.0993505, 37.4602831, 0.0 ],
							[ 129.0994026, 37.4601428, 0.0 ],
							[ 129.0995651, 37.4599418, 0.0 ],
							[ 129.0996856, 37.4598223, 0.0 ],
							[ 129.0997964, 37.4597234, 0.0 ],
							[ 129.0999333, 37.4596142, 0.0 ],
							[ 129.100106, 37.4595595, 0.0 ],
							[ 129.1003036, 37.4595856, 0.0 ],
							[ 129.1003149, 37.4595794, 0.0 ],
							[ 129.1003386, 37.4595663, 0.0 ],
							[ 129.1010049, 37.4591995, 0.0 ],
							[ 129.1013932, 37.4589725, 0.0 ],
							[ 129.1016008, 37.4590387, 0.0 ],
							[ 129.1018291, 37.4591827, 0.0 ],
							[ 129.1019657, 37.4593498, 0.0 ],
							[ 129.1021106, 37.4594236, 0.0 ],
							[ 129.1021445, 37.4594393, 0.0 ],
							[ 129.1022708, 37.459521, 0.0 ],
							[ 129.1022995, 37.4595387, 0.0 ],
							[ 129.102646, 37.4598674, 0.0 ],
							[ 129.1026827, 37.4597781, 0.0 ],
							[ 129.1027003, 37.4597329, 0.0 ],
							[ 129.1028087, 37.4597254, 0.0 ],
							[ 129.1029542, 37.4597325, 0.0 ],
							[ 129.103073, 37.4597611, 0.0 ],
							[ 129.1031674, 37.459766, 0.0 ],
							[ 129.1032543, 37.4597701, 0.0 ],
							[ 129.1034514, 37.4597574, 0.0 ],
							[ 129.1035588, 37.4598353, 0.0 ],
							[ 129.1036495, 37.4598677, 0.0 ],
							[ 129.1038207, 37.459932, 0.0 ],
							[ 129.1038999, 37.4600065, 0.0 ],
							[ 129.1039547, 37.4600568, 0.0 ],
							[ 129.1039812, 37.4601836, 0.0 ],
							[ 129.1039864, 37.4602315, 0.0 ],
							[ 129.1039861, 37.4602688, 0.0 ],
							[ 129.1039978, 37.4602688, 0.0 ],
							[ 129.1039919, 37.4604538, 0.0 ],
							[ 129.1040353, 37.4605576, 0.0 ],
							[ 129.1040582, 37.4605856, 0.0 ],
							[ 129.1041827, 37.4607269, 0.0 ],
							[ 129.1042611, 37.460802, 0.0 ],
							[ 129.1043109, 37.4608172, 0.0 ],
							[ 129.1044202, 37.4609565, 0.0 ],
							[ 129.1044388, 37.460985, 0.0 ],
							[ 129.1044841, 37.4610294, 0.0 ],
							[ 129.1045325, 37.4610566, 0.0 ],
							[ 129.1046371, 37.4610998, 0.0 ],
							[ 129.1047922, 37.46116, 0.0 ],
							[ 129.1047616, 37.4612636, 0.0 ],
							[ 129.1046237, 37.4614448, 0.0 ],
							[ 129.1045623, 37.4616124, 0.0 ],
							[ 129.1045229, 37.4616837, 0.0 ],
							[ 129.1044829, 37.4617559, 0.0 ],
							[ 129.104477, 37.4617746, 0.0 ],
							[ 129.104353, 37.4621748, 0.0 ],
							[ 129.104717, 37.4621546, 0.0 ],
							[ 129.1048787, 37.4621611, 0.0 ],
							[ 129.1049343, 37.4621545, 0.0 ],
							[ 129.1050422, 37.4621417, 0.0 ],
							[ 129.1051403, 37.4621462, 0.0 ],
							[ 129.1052828, 37.4621705, 0.0 ],
							[ 129.10562, 37.4621785, 0.0 ],
							[ 129.105668, 37.4622361, 0.0 ],
							[ 129.1059373, 37.4623546, 0.0 ],
							[ 129.1061539, 37.4624013, 0.0 ],
							[ 129.1061791, 37.4624068, 0.0 ],
							[ 129.1063594, 37.4624174, 0.0 ],
							[ 129.106479, 37.4624244, 0.0 ],
							[ 129.1066839, 37.462411, 0.0 ],
							[ 129.1068918, 37.46237, 0.0 ],
							[ 129.1071967, 37.4622332, 0.0 ],
							[ 129.1073135, 37.4621808, 0.0 ],
							[ 129.1074382, 37.4621858, 0.0 ],
							[ 129.1075262, 37.4621894, 0.0 ],
							[ 129.1077909, 37.4622245, 0.0 ],
							[ 129.1078208, 37.4624344, 0.0 ],
							[ 129.1078376, 37.4624651, 0.0 ],
							[ 129.1076816, 37.4625014, 0.0 ],
							[ 129.1074559, 37.4625457, 0.0 ],
							[ 129.1074139, 37.4625539, 0.0 ],
							[ 129.1074334, 37.4626746, 0.0 ],
							[ 129.1074223, 37.4626756, 0.0 ],
							[ 129.107347, 37.4626816, 0.0 ],
							[ 129.1071586, 37.4626968, 0.0 ],
							[ 129.1069913, 37.4627112, 0.0 ],
							[ 129.1069498, 37.4627147, 0.0 ],
							[ 129.1067477, 37.4627298, 0.0 ],
							[ 129.1067228, 37.4627336, 0.0 ],
							[ 129.1066783, 37.4627404, 0.0 ],
							[ 129.1066767, 37.4627406, 0.0 ],
							[ 129.1064691, 37.4627552, 0.0 ],
							[ 129.1064221, 37.4627602, 0.0 ],
							[ 129.1062607, 37.4627751, 0.0 ],
							[ 129.1061922, 37.4627809, 0.0 ],
							[ 129.1060057, 37.4627942, 0.0 ],
							[ 129.1059456, 37.462799, 0.0 ],
							[ 129.105826, 37.4628083, 0.0 ],
							[ 129.1058291, 37.4628309, 0.0 ],
							[ 129.1058298, 37.4628366, 0.0 ],
							[ 129.1058516, 37.4629966, 0.0 ],
							[ 129.1058023, 37.4630001, 0.0 ],
							[ 129.1054841, 37.4630227, 0.0 ],
							[ 129.1054475, 37.4630262, 0.0 ],
							[ 129.1053363, 37.4630338, 0.0 ],
							[ 129.1053006, 37.4630167, 0.0 ],
							[ 129.1052331, 37.4630225, 0.0 ],
							[ 129.1053323, 37.4637225, 0.0 ],
							[ 129.1053377, 37.46376, 0.0 ],
							[ 129.1053425, 37.4637941, 0.0 ],
							[ 129.1053602, 37.4637983, 0.0 ],
							[ 129.1053776, 37.4638025, 0.0 ],
							[ 129.1053942, 37.463971, 0.0 ],
							[ 129.1054661, 37.4639647, 0.0 ],
							[ 129.1054919, 37.4639616, 0.0 ],
							[ 129.1055527, 37.4639557, 0.0 ],
							[ 129.1057135, 37.463944, 0.0 ],
							[ 129.1058477, 37.4639327, 0.0 ],
							[ 129.1061737, 37.4639029, 0.0 ],
							[ 129.1063419, 37.4638908, 0.0 ],
							[ 129.1063486, 37.4639312, 0.0 ],
							[ 129.1063733, 37.4640793, 0.0 ] ] ]
				      },
				      "properties": {
				        "prop0": "value0",
				        "prop1": { "this": "that" },
				        "zoneName": "TEST 예정지구",
				      }
				    }
				  ]
				};

		var style = [ new ol.style.Style({
			fill : new ol.style.Fill({
				color : 'rgba(215, 35, 77, 1)'
			}),
			stroke : new ol.style.Stroke({
				color : 'black',
				width : 10,
			}),
		/*		new ol.style.Style({stroke: new ol.style.Stroke({color: 'black',width: 6})}),new ol.style.Style({stroke: new ol.style.Stroke({color: 'white',width: 4})}),new ol.style.Style({stroke: new ol.style.Stroke({color: 'red',width: 2})}) */
		}) ];

		/* geojson코드 담음 폴리곤 */
		let features = new ol.format.GeoJSON().readFeatures(geoJson);
		/* featureSource 소스를 담아줄 세팅 그릇 역할 */
		let featureSource = new ol.source.Vector({
			features : features
		// ex) features : [features,features,features]
		})
		/* 실제 Layer를 띄워주게 하는 역할 */
		const featureLayer = new ol.layer.Vector({
			source : featureSource,
			style : style,
		})

		let view = new ol.View({
			center : [ 127.10369206558485, 37.462755923721225 ], // 필수적으로 center 좌표 잡아 줘야함
			zoom : 15, // zoom 필수로 1~12 사이 값 넣어야함
			projection : 'EPSG:4326', // default 좌표
		});
		
		let map = new ol.Map({
			target : 'map',
			layers : [ new ol.layer.Tile({
				/* source: new ol.source.OSM({url: 'https://maps.wikimedia.org/osm-intl/{z}/{x}/{y}.png'},)// {url: 'https://maps.wikimedia.org/osm-intl/{z}/{x}/{y}.png'} */
				source : new ol.source.OSM()
			/* source: new ol.source.Stamen({layer:'watercolor' }) */
			}) ],
			view : view,

		});
		map.addLayer(featureLayer);
	
		map.on('click', function(evt) {

			var feature = map.forEachFeatureAtPixel(evt.pixel,
					function(feature) {
						let values = feature.getProperties();
						console.log(values);
						return feature;
					});
			//feature 값 불러오기
			if (feature != null) {
				//feature의 값 중, name을 불러오기
				console.log(feature.get('zoneName'));
				
				document.getElementById('info').innerHTML = ''; // 속성정보를 표출할 div 초기화
				let coordinate = evt.coordinate;
				console.log(coordinate);
				document.getElementById('info').innerHTML = '<div>' + coordinate +'/////'+feature.get('zoneName')+'/////'
						+ '</div>';
			}
		});
	</script>

</body>
</html>