class EditPasswordParam {
    String confirmPassword;
    String oldPassword;
    String password;

    EditPasswordParam({required this.confirmPassword, required this.oldPassword, required this.password});

    factory EditPasswordParam.fromJson(Map<String, dynamic> json) {
        return EditPasswordParam(
            confirmPassword: json['confirm_password'], 
            oldPassword: json['old_password'], 
            password: json['password'], 
        );
    }

    Map<String, dynamic> toMap() {
        final Map<String, dynamic> data = <String, dynamic>{};
        data['confirm_password'] = confirmPassword;
        data['old_password'] = oldPassword;
        data['password'] = password;
        return data;
    }
}