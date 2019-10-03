---
date: "2019-10-02"
title: Inequality in Canada: Interactive Map
---


# Income inequality and health research

I wrote my Master's thesis on the topic of income inequality and health in Canadian cities. To show inequality throughout Canada, I mapped inequality levels for each Canadian city for three time periods: 2001, 2006, and 2011.

Here is a reproduction of that map, which now includes 2016.

# Map

*note to self- needed to have the ```htm - l tag to indicate the start of html code*

```html
<html>
<head>
  <title>Economic Inequality in Canadian Cities</title>
  <link rel="stylesheet" href="http://cdn.leafletjs.com/leaflet-0.7.3/leaflet.css"/>
  <script src="http://cdn.leafletjs.com/leaflet-0.7.3/leaflet.js"></script>
  <style>
    #map{ width: 900px; height: 500px; }
  </style>
</head>
<body>

  <div id="map"></div>

  <script>

  // initialize the map - lower zoom number means further out on the map
  var map = L.map('map').setView([49.51, -97.68], 4);

  // load a tile layer
  L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
    {
  	minZoom: 2,
    maxZoom: 15,
  	attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
  }).addTo(map);


  </script>
</body>
</html>
```
