// final String base = 'http://127.0.0.1:8000/api/v1';
// final String base = 'http://localhost:8000/api/v1';
import 'package:shoplite/models/site_setting.dart';

import '../models/profile.dart';

final String base = 'http://10.0.2.2:8000/api/v1';
final String api_register =
    base + "/register"; // Thay bằng API thật localhost:8000/api/v1/register
final String api_updateprofile = base +
    "/updateprofile"; // Thay bằng API thật localhost:8000/api/v1/register
final String api_ge_product_list = base + "/getproductlist"; //
final String api_login = base + "/login";

final String api_sitesetting = base + "/getsitesetting";

var g_sitesetting =
    SiteSetting(id: 0, company_name: 'company_name', logo: 'logo');

var app_type = "app";
var g_token = "";
Profile initialProfile = Profile(
    full_name: 'md',
    phone: '',
    address: '',
    photo: '',
    username: '',
    email: '');
