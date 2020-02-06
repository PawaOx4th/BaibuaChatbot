import 'package:baibuaapp/Screens/menu/map.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapDetail {
  String namefacultyTH;
  String namefacultyEN;
  String description;
  String thumbNail;
  String address;
  LatLng location;

  MapDetail({
    this.namefacultyTH,
    this.namefacultyEN,
    this.address,
    this.description,
    this.location,
    this.thumbNail,
  });
}

final List<MapDetail> mapDetail = [
  //** Engineering
  MapDetail(
    namefacultyTH: "คณะวิศวกรรมศาสตร์ (วศ.)",
    namefacultyEN: "Faculty of  Engineering (EN)",
    address: "www.engineer.rmutt.ac.th",
    description: "ห้องเรียนที่ขึ้นต้นรหัสห้อง EN",
    thumbNail:
        "https://lh3.googleusercontent.com/yEes5HPfC6H8T923-El443opKWTTTjvliqOHa3C14d8wgkiHMDeDslLkSrLqRrwjYQ=w408-h306-k-no",
    location: LatLng(
      14.0366201,
      100.7266944,
    ),
  ),

  //? 14.0366201,100.7266944

  //** Business
  MapDetail(
    namefacultyTH: "คณะบริหารธุรกิจ (บธ.)",
    namefacultyEN: "Faculty of  Business Administration (BA)",
    address: "www.bus.rmutt.ac.th",
    description: "ห้องเรียนที่ขึ้นต้นรหัสห้อง BA",
    thumbNail:
        "https://lh5.googleusercontent.com/p/AF1QipNQNj7ditsJDQctwLThRH6q1GtdPOViF2rTl4P8=w408-h240-k-no-pi-20-ya286-ro0-fo100",
    location: LatLng(
      14.037320,
      100.731278,

      //? 14.037320, 100.731278
    ),
  ),

  //** Home Economics
  MapDetail(
    namefacultyTH: "คณะเทคโนโลยีคหกรรมศาสตร์ (ทค.)",
    namefacultyEN: "Faculty of  Home Economics Technology (HT)",
    address: "www.het.rmutt.ac.th",
    description: "ห้องเรียนที่ขึ้นต้นรหัสห้อง HT",
    thumbNail:
        "https://lh5.googleusercontent.com/p/AF1QipOv8v-9HUfMh75iAux-n4Tc_YtAM_6XJRkjIVhh=w426-h240-k-no",
    location: LatLng(
      14.037253,
      100.728893,

      //? 14.037253, 100.728893
    ),
  ),
];
