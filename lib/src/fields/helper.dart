// Formula to create field map entry in Libre Office from Profile.ods messages sheet
// =B285 & ": {'field_name': '" & C285 & "', 'data_type': '" & D285 & "', " & WENN(G285 <> "";"'scale': " & G285 & ", "; "") & WENN(H285 <> ""; "'offset': " & H285 &  ", "; "") & WENN(I285 <> ""; "'units': '" & I285 & "', "; "") & "},"
// Note: 1) change data_type to field_type manually, if necessary
//       2) import in fit_message.dart

Map _fields = {

};