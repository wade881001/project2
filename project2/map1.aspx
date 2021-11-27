<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="map1.aspx.cs" Inherits="project.map1" %>
<asp:Content ID="Content3" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <html xmlns="http://www.w3.org/1999/xhtml">
 
   
        <script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script>

    
    <style type="text/css" media="screen">
       
    html {
        height: 100%;
        width: 100%;
    }

    #map_canvas {
        position: absolute;
        top: 25%;
        left: 0;
        height: 75%;
        width: 100vw;
    }

    #body {
        height: 100%;
        width: 100vw;
        position: relative;
        top: 0;
        left: 0;
    }
    </style>

        
        
     
  <div class="body">
        
        <div id="map_canvas"></div>
   
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script type="text/javascript">
        function AddMark(map) {
            //用jQuery的Ajax，向GoogleMapHandler.ashx要求座標資料
            //更多用法請看jQuery API
            $.ajax({
                url: '/GoogleMapHandler2.ashx',
                type: 'GET',
                data: { key: $('#map_key').val() },
                dataType: 'json',
                success: function (data, textStatus) {
                    var i = 1;
                    for (var item in data) {
                        //建立經緯度座標
                        
                        
                        var imageUrl = "../assets/img/" + i + ".png";
                        i += 1;
                        var myLatlng = new google.maps.LatLng(data[item].Lat, data[item].Lng);
                        var imageUrl1 = "../assets/img/photo1.png";

                        //加一個Marker到map中
                        //更多用法可看Google Map API V3
                        var marker = new google.maps.Marker({
                            position: myLatlng,
                            map: map,
                            title: data[item].Title,
                            icon: imageUrl
                        });
                    }

                    

                    var latlng2 = new google.maps.LatLng(25.0604413, 121.3698009);
                    var marker2 = new google.maps.Marker({
                        position: latlng2,
                        map: map,
                        title: "",
                        icon: imageUrl1
                    });
                }
            });
        }

        function initMap() {
            var latlng = new google.maps.LatLng(25.0604413, 121.3698009);
            var myOptions = {
                zoom: 14,
                center: latlng,
                mapTypeId: google.maps.MapTypeId.ROADMAP
            };
            var map = new google.maps.Map(document.getElementById("map_canvas"), myOptions);
            AddMark(map);

        }
    </script>
     <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC_Za7RqKvUuEg2Nln0EcpUVN3k2fZtDuE&callback=initMap">
    </script>
        </div>
     

    </html>
</asp:Content>
