const String BASE_URL = "https://dkapi.duakelinci.id:9393/api/webusagi/v2/hc/";
const int BASE_TIMEOUT = 60000 * 1;//1 MENIT
const String TYPE_APLIKASI = "hc";
const String NIK_EXAMPLE = '20101720';


const String varDashboard = "Dashboard";
const String varRekapIzin = "Rekap Izin";
const String varGreeting = "Semoga Hari Anda Menyenangkan";
const String varGreetingLogin = "Silahkan login untuk melanjutkan";
const String varTotalAlpha = "Total Alpha";
const String varSisaCuti = "Sisa Cuti";
const String varTotalIzin = "Total Izin";
const String varIzinBelumDisetujui = "Izin Belum Disetujui";
const String varIzinDisetujui = "Izin Disetujui";
const String varIzinDitolak = "Izin Ditolak";
const String varUsername = "Username";
const String varPassword = "Password";

List<String> listTipeIzin = [
  "Full Day",
  "Half Day",
];

List<String> listKategoriIzin1 = [
  "Cuti",
  "Sakit",
  "Menikah"
];

List<String> listKategoriIzin2 = [
  "Izin Keluar",
  "Izin Pulang Cepat",
  "Izin Datang Terlambat",
  "Izin Keperluan Mendadak",
];