<%@ Page Title="首頁" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="WebForm5.aspx.cs" Inherits="_0225.WebForm5" %>
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
                url: '/GoogleMapHandler.ashx',
                type: 'GET',
                data: { key: $('#map_key').val() },
                dataType: 'json',
                success: function (data, textStatus) {
                    for (var item in data) {
                        
                        //建立經緯度座標
                        /* switch (data[item].type) {
                             case "迴轉":
                                 var imageUrl = "./photo.png";
                                 break;
                             case "外帶":
                                 var imageUrl = "./photo2.png";
                                 break;
                             case "定食":
                                 var imageUrl = "./photo3.png";
                                 break;
                             default:
                                 var imageUrl = "./photo.png";
                                 break;
                         }
                         */

                        var myLatlng = new google.maps.LatLng(data[item].Lat, data[item].Lng);
                        var imageUrl = "../assets/img/photo.png";
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
    <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBQqQX0ZMBFwCB0LdYlViS56DJnNR7pVoc&callback=initMap">
    </script>
        </div>

</html>
</asp:Content>