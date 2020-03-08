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
  //----- Faculty Building -----
  //** Engineering
  MapDetail(
    namefacultyTH: "คณะวิศวกรรมศาสตร์ (วศ.)",
    namefacultyEN: "Faculty of  Engineering (EN)",
    address: "www.engineer.rmutt.ac.th",
    description: "ห้องเรียนที่ขึ้นต้นรหัสห้อง EN",
    thumbNail:
        "https://lh3.googleusercontent.com/yEes5HPfC6H8T923-El443opKWTTTjvliqOHa3C14d8wgkiHMDeDslLkSrLqRrwjYQ=w408-h306-k-no",
    location: LatLng(
      14.036438,
      100.726180,
    ),
  ),

  //? 14.0366201,100.7266944

  //** Business Administration
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

  //** Home Economics Technology
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

  //** Fine and Applied Arts
  MapDetail(
    namefacultyTH: "คณะศิลปกรรมศาสตร์ (ศก.)",
    namefacultyEN: "Faculty of  Fine and Applied Arts (FA)",
    address: "www.fa.rmutt.ac.th",
    description: "ห้องเรียนที่ขึ้นต้นรหัสห้อง FA",
    thumbNail:
        "https://lh5.googleusercontent.com/p/AF1QipNjiwvt4cdedAwIxTHmF-sFAl4TuqDrn95K_ZN9=w408-h240-k-no-pi-20-ya229-ro0-fo100",
    location: LatLng(
      14.037284,
      100.728011,
    ),
  ),

  //** Agricultural Technology
  MapDetail(
    namefacultyTH: "คณะเทคโนโลยีการเกษตร (ทก.)",
    namefacultyEN: "Faculty of Agricultural Technology (AT)",
    address: "www.agr.rmutt.ac.th",
    description: "ห้องเรียนที่ขึ้นต้นรหัสห้อง AT",
    thumbNail:
        "https://lh5.googleusercontent.com/p/AF1QipPyt3x_YK750irZ-QU7bU5hTEXcE4LYn5XMWhOj=w426-h240-k-no",
    location: LatLng(
      14.039130,
      100.726735,
    ),
  ),

  //** Technical Education
  MapDetail(
    namefacultyTH: "คณะครุศาสตร์อุตสาหกรรม (คอ.)",
    namefacultyEN: "Faculty of  Technical Education (TE)",
    address: "www.teched.rmutt.ac.th",
    description: "ห้องเรียนที่ขึ้นต้นรหัสห้อง TE",
    thumbNail:
        "https://lh5.googleusercontent.com/p/AF1QipNnqXO5KJafsS387CJpqoDnjbW6CzXVn1MW4geN=w408-h240-k-no-pi-10-ya27.999996-ro-0-fo100",
    location: LatLng(
      14.036390,
      100.730907,
    ),
  ),

  //** Architecture
  MapDetail(
    namefacultyTH: "คณะสถาปัตยกรรมศาสตร์ (สถ.)",
    namefacultyEN: "Faculty of Architecture (AR)",
    address: "www.arch.rmutt.ac.th",
    description: "ห้องเรียนที่ขึ้นต้นรหัสห้อง AR",
    thumbNail:
        "https://lh5.googleusercontent.com/p/AF1QipPzmWGXVvomCaM_U5llD7ExUDPj4mycxPGZWLuK=w408-h263-k-no",
    location: LatLng(
      14.038300,
      100.730955,
    ),
  ),

  //** Science and Technology
  MapDetail(
    namefacultyTH: "คณะวิทยาศาสตร์และเทคโนโลยี (วท.)",
    namefacultyEN: "Faculty of  Science and Technology (ST)",
    address: "www.sci.rmutt.ac.th",
    description: "ห้องเรียนที่ขึ้นต้นรหัสห้อง ST",
    thumbNail:
        "https://lh5.googleusercontent.com/p/AF1QipMTvb7HcbxvvZYz8kkOZo8cth-cZ2fJybyOsjb7=w408-h240-k-no-pi-20-ya353-ro-0-fo100",
    location: LatLng(
      14.039584,
      100.728832,
    ),
  ),

  //** Mass Communication Technology
  MapDetail(
    namefacultyTH: "คณะเทคโนโลยีสื่อสารมวลชน (ทสม.)",
    namefacultyEN: "Faculty of  Mass Communication Technology (MT)",
    address: "www.mct.rmutt.ac.th",
    description: "ห้องเรียนที่ขึ้นต้นรหัสห้อง MT",
    thumbNail:
        "https://lh5.googleusercontent.com/p/AF1QipOg5EGlscNd6hT217akdYiwdmgQblxV5F4UQJT-=w408-h240-k-no-pi-20-ya170.00002-ro0-fo100",
    location: LatLng(
      14.039488,
      100.726893,
    ),
  ),

  //** Liberal Arts
  MapDetail(
    namefacultyTH: "คณะศิลปศาสตร์ (ศศ.)",
    namefacultyEN: "Faculty of  Liberal Arts (LA)",
    address: "www.larts.rmutt.ac.th",
    description: "ห้องเรียนที่ขึ้นต้นรหัสห้อง LA",

    //~ Image doesn't like real environment
    thumbNail:
        "https://lh5.googleusercontent.com/p/AF1QipN7SdASXXeQv8BA_wKu4cG_Uuf5xt8UgKLeGfUt=w408-h272-k-no",
    location: LatLng(
      14.038119,
      100.728965,
    ),
  ),

  //** Traditional Medicine College
  MapDetail(
    namefacultyTH: "วิทยาลัยการแพทย์แผนไทย (วพท.)",
    namefacultyEN: "Thai Traditional Medicine College (TC)",
    address: "www.tmc.rmutt.ac.th",
    description: "ห้องเรียนที่ขึ้นต้นรหัสห้อง TC",
    thumbNail:
        "https://lh5.googleusercontent.com/p/AF1QipPWAcFcYqMeByM1MicbNL02huP-P9cLY1lyy2Ap=w408-h725-k-no",
    location: LatLng(
      14.038244,
      100.728071,
    ),
  ),

  //** Nurse
  MapDetail(
    namefacultyTH: "คณะพยาบาลศาสตร์",
    namefacultyEN: "Faculty of Nurse",
    address: "www.nurse.rmutt.ac.th",

    //~ Not Found Room Code
    description: "ห้องเรียนที่ขึ้นต้นรหัสห้อง ",

    //~ Image not found in google map
    thumbNail: "",
    location: LatLng(14.036315, 100.728143),
  ),

  //----- Service Building -----
  //* President Office Building
  MapDetail(
    namefacultyTH: "สำนักงานอธิการบดี",
    namefacultyEN: "President Office Building",
    address: "",
    description: "",
    thumbNail:
        "https://lh3.googleusercontent.com/mfQwp-Tl3_eGoo5yp2OHdlVsdD98OvoDbuO8-KCHO0K6zK9Sx3KiSh0J4qyjAQSuZg=w408-h306-k-no",
    location: LatLng(
      14.033980,
      100.730071,
    ),
  ),

  //* Shop Welfare
  MapDetail(
    namefacultyTH: "ร้านค้าสวัสดิการ",
    namefacultyEN: "Shop Welfare",
    address: "",
    description: "",
    thumbNail:
        "https://lh5.googleusercontent.com/p/AF1QipPWwJIn6SJla4r2imAQcX3fOKdUXIXY2vaAvDrW=w408-h306-k-no",
    location: LatLng(
      14.036438,
      100.729650,
    ),
  ),

  //* RMUTT Student Service Center
  MapDetail(
    namefacultyTH: "ศูนย์บริการนักศึกษา",
    namefacultyEN: "RMUTT Student Service Center",
    address: "",
    description: "",
    thumbNail: "",
    location: LatLng(
      14.036496,
      100.730007,
    ),
  ),

  //----- Activity Building -----
  //* Cafeteria
  MapDetail(
    namefacultyTH: "โรงอาหารกลาง",
    namefacultyEN: "Central Cafeteria",

    //~ No such an address
    address: "",
    description: "เปิดให้บริการช่วง 06:00 - 17:00",
    thumbNail:
        "https://lh5.googleusercontent.com/p/AF1QipPCfjevYP9LZ2pOwqmdLikwo3CJH5nWESnsw3rh=w408-h306-k-no",
    location: LatLng(14.035408, 100.724520),
  ),

  //* Academic Services Building
  MapDetail(
    namefacultyTH: "อาคารวิทยะบริการ",
    namefacultyEN: "Academic Services Building",
    address: "http://www.elib.rmutt.ac.th/",
    description: "เปิดให้บริการช่วง 08:30 - 23:30",
    thumbNail:
        "https://lh5.googleusercontent.com/p/AF1QipPzYN-TAu0h3fDoZ7aCdm10p7nstBk2oG2iu4lu=w408-h240-k-no-pi-1.0458841-ya340.02625-ro2.894942-fo100",
    location: LatLng(14.034380, 100.725678),
  ),

  //* Central Stadium
  MapDetail(
    namefacultyTH: "สนามกีฬากลาง",
    namefacultyEN: "Central Stadium",

    //~ No such an address
    address: "",
    description: "เปิดให้บริการช่วง 05:00 - 23:00",
    thumbNail:
        "https://lh5.googleusercontent.com/p/AF1QipNEjR6Eeo2kubvgABywdwB7pmVGPA2Yxi5ORKyB=w408-h306-k-no",
    location: LatLng(
      14.035378,
      100.723400,
    ),
  ),

  //* Tennis Court
  MapDetail(
    namefacultyTH: "สนามเทนนิส",
    namefacultyEN: "Tennis Court",

    //~ No such an address
    address: "",
    description: "เปิดให้บริการช่วง 08:30 - 21:00",
    thumbNail:
        "https://lh5.googleusercontent.com/p/AF1QipOlCvDq0o5zvM-45HNfWHa8IVijrkUaOy71xNpp=w408-h306-k-no",
    location: LatLng(14.033598, 100.723153),
  ),

  //* Swimming Pool
  MapDetail(
    namefacultyTH: "สระว่ายน้ำ",
    namefacultyEN: "Swimming Pool",

    //~ No such an address
    address: "",
    description: "เปิดให้บริการช่วง 16:30 - 21:00",
    thumbNail:
        "https://lh5.googleusercontent.com/p/AF1QipPmvPOcwa2soHYbHp6cHip8f-Ic3nMuD6E-kyYv=w408-h306-k-no",
    location: LatLng(
      14.032973,
      100.721812,
    ),
  ),

  //* Basketball Court
  MapDetail(
    namefacultyTH: "สนามบาสเก็ตบอล",
    namefacultyEN: "Basketball Court",

    //~ No such an address
    address: "",
    description: "เปิดให้บริการช่วง 08:30 - 21:00",
    thumbNail:
        "https://lh5.googleusercontent.com/p/AF1QipNik75uOYThGv2-Rs0ijfbjKRnRD1g0omMl18vd=w408-h240-k-no-pi-0-ya30.000002-ro-0-fo100",
    location: LatLng(
      14.035123,
      100.724491,
    ),
  ),

  //* Gymnasium Building
  MapDetail(
    namefacultyTH: "สนามออกกำลังกาย",
    namefacultyEN: "Gymnasium Building",

    //~ No such an address
    address: "",
    description: "เปิดให้บริการช่วง 08:30 - 21:00",
    thumbNail:
        "https://lh5.googleusercontent.com/p/AF1QipMu789dRuAsMJb_o5AtY_1FXmvYjrvM-pjrvClQ=w426-h240-k-no",
    location: LatLng(
      14.034321,
      100.724361,
    ),
  ),

  //* Football Court
  MapDetail(
    namefacultyTH: "สนามฟุตบอล",
    namefacultyEN: "Football Court",

    //~ No such an address
    address: "",
    description: "เปิดให้บริการช่วง 08:30 - 21:00",

    //~ Image not found in google map
    thumbNail: "",
    location: LatLng(
      14.035848,
      100.730928,
    ),
  ),

  //* Nursing Center
  MapDetail(
    namefacultyTH: "ศูนย์พยาบาล",
    namefacultyEN: "Nursing Center",

    //~ No such an address
    address: "",
    description: "เปิดให้บริการช่วง 08:30 - 16:30",

    //~ Image not found in google map
    thumbNail: "",
    location: LatLng(
      14.036919,
      100.723269,
    ),
  ),

  //----- Other Building -----
  //* Student Dormitory
  MapDetail(
    namefacultyTH: "หอพักนักศึกษา",
    namefacultyEN: "Student Dormitory",

    //~ No such an address
    address: "",

    //~ No such a description
    description: "",
    thumbNail:
        "https://lh5.googleusercontent.com/p/AF1QipOFMnMx9qWRnTprc-LjMXZNDAkudjeFYnM5eeZl=w426-h240-k-no",
    location: LatLng(
      14.032520,
      100.722488,
    ),
  ),

  //* International Dormitory
  MapDetail(
    namefacultyTH: "หอพักนักศึกษา (ต่างประเทศ)",
    namefacultyEN: "International Dormitory",

    //~ No such an address
    address: "",

    //~ No such a description
    description: "",
    thumbNail:
        "https://lh5.googleusercontent.com/p/AF1QipNzsP-yb2Ij6QBDoatc82QGGHa5elOXzRysqwQD=w408-h306-k-no",
    location: LatLng(
      14.031874,
      100.722476,
    ),
  ),

  //----- Specific Engineering Building -----
  //* Computer Engineering Building
  MapDetail(
    namefacultyTH: "อาคารวิศวกรรมคอมพิวเตอร์",
    namefacultyEN: "Computer Engineering Department",
    address: "",
    description: "",
    thumbNail:
        "https://lh6.googleusercontent.com/VkmpZBuOxKB_P9wrIWIjUrI4RG998F0ANUMip4mx4aNkMlC2XGRG_9KqLlIKPpU3LQ=w408-h306-k-no",
    location: LatLng(
      14.035892,
      100.725436,
    ),
  ),

  //* Electrical Engineering Building
  MapDetail(
    namefacultyTH: "อาคารวิศวกรรมไฟฟ้า",
    namefacultyEN: "Electrical Engineering Department",
    address: "",
    description: "",

    //~ Image not found in google map
    thumbNail: "",
    location: LatLng(
      14.036278,
      100.725287,
    ),
  ),

  //* Mechanical Engineering Building
  MapDetail(
    namefacultyTH: "อาคารวิศวกรรมเครื่องกล",
    namefacultyEN: "Mechanical Engineering Department",
    address: "",
    description: "",
    thumbNail:
        "https://lh5.googleusercontent.com/p/AF1QipNjYSFak_uTRCE8e-v2rDjoR9Z9eKrPeEQn_P8C=w408-h240-k-no-pi-0-ya99.999985-ro-0-fo100",
    location: LatLng(
      14.036858,
      100.724317,
    ),
  ),

  //* Civil Engineering Building
  MapDetail(
    namefacultyTH: "อาคารวิศวกรรมโยธา",
    namefacultyEN: "Civil Engineering Department",
    address: "",
    description: "",

    //~ Image not found in google map
    thumbNail: "",
    location: LatLng(
      14.036862,
      100.725524,
    ),
  ),

  //* Electronics and Telecommunication Engineering Building
  MapDetail(
    namefacultyTH: "อาคารวิศกรรมอิเล็กทรอนิกส์และโทรคมนาคม",
    namefacultyEN: "Electronics and Telecommunication Engineering Department",
    address: "",
    description: "",

    //~ Image not found in google map
    thumbNail: "",
    location: LatLng(
      14.037413,
      100.726157,
    ),
  ),

  //* Industrial Engineering Building
  MapDetail(
    namefacultyTH: "อาคารวิศวกรรมอุตสาหการ",
    namefacultyEN: "Industrial Engineering Department",
    address: "",
    description: "",
    thumbNail:
        "https://lh5.googleusercontent.com/p/AF1QipPyATtf01UQrfcGWaA-jnuTOJFIoxRtScgm_oxK=w408-h240-k-no-pi-20-ya52.999992-ro-0-fo100",
    location: LatLng(
      14.038061,
      100.724457,
    ),
  ),

  //* Material and Metallurgical Engineering Building
  MapDetail(
    namefacultyTH: "อาคารวิศวกรรมวัสดุ",
    namefacultyEN: "Material and Metallurgical Engineering Department",
    address: "",
    description: "",

    //~ Image not found in google map
    thumbNail: "",
    location: LatLng(
      14.038134,
      100.725553,
    ),
  ),

  //* Agricultural Engineering Building
  MapDetail(
    namefacultyTH: "อาคารวิศวกรรมเกษตร",
    namefacultyEN: "Agricultural Engineering Department",
    address: "",
    description: "",

    //~ Image not found in google map
    thumbNail: "",
    location: LatLng(
      14.037429,
      100.726672,
    ),
  ),

  //* Chemical Engineering Building
  MapDetail(
    namefacultyTH: "อาคารวิศวกรรมเคมี",
    namefacultyEN: "Chemical Engineering Department",
    address: "",
    description: "",
    thumbNail:
        "https://lh5.googleusercontent.com/p/AF1QipPpfQXJ0ODQznjWxEwR6lvi2cxHnKriBXkNbIeS=w408-h240-k-no-pi-0-ya64.000015-ro-0-fo100",
    location: LatLng(
      14.038163,
      100.727200,
    ),
  ),

  //* Texile Engineering Building
  MapDetail(
    namefacultyTH: "อาคารวิศวกรรมสิ่งทอ",
    namefacultyEN: "Texile Engineering Department",
    address: "",
    description: "",

    //~ Image not found in google map
    thumbNail: "",
    location: LatLng(
      14.038100,
      100.726243,
    ),
  ),
];
