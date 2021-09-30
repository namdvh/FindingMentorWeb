/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package c4.fm.user;

/**
 *
 * @author MSI
 */
public class UserError {
    private String UserIDError;
    private String NameError;
    private String EmailError;
    private String RoleIDError;
    private String PhoneNumberError;
    private String Address;
    private String passwordError;
    private String confirmPasswordError;
    private String CertificateError;
    private String BirthdayError;

    public UserError() {
    }
    public UserError(String UserIDError, String NameError, String EmailError, String PhoneNumberError, String Address, String passwordError, String confirmPasswordError, String CertificateError, String BirthdayError) {
        this.UserIDError = UserIDError;
        this.NameError = NameError;
        this.EmailError = EmailError;
        this.PhoneNumberError = PhoneNumberError;
        this.Address = Address;
        this.passwordError = passwordError;
        this.confirmPasswordError = confirmPasswordError;
        this.CertificateError = CertificateError;
        this.BirthdayError = BirthdayError;
    }

    public String getUserIDError() {
        return UserIDError;
    }

    public void setUserIDError(String UserIDError) {
        this.UserIDError = UserIDError;
    }

    public String getNameError() {
        return NameError;
    }

    public void setNameError(String NameError) {
        this.NameError = NameError;
    }

    public String getEmailError() {
        return EmailError;
    }

    public void setEmailError(String EmailError) {
        this.EmailError = EmailError;
    }

    public String getPhoneNumberError() {
        return PhoneNumberError;
    }

    public void setPhoneNumberError(String PhoneNumberError) {
        this.PhoneNumberError = PhoneNumberError;
    }

    public String getAddress() {
        return Address;
    }

    public void setAddress(String Address) {
        this.Address = Address;
    }

    public String getPasswordError() {
        return passwordError;
    }

    public void setPasswordError(String passwordError) {
        this.passwordError = passwordError;
    }

    public String getConfirmPasswordError() {
        return confirmPasswordError;
    }

    public void setConfirmPasswordError(String confirmPasswordError) {
        this.confirmPasswordError = confirmPasswordError;
    }

    public String getCertificateError() {
        return CertificateError;
    }

    public void setCertificateError(String CertificateError) {
        this.CertificateError = CertificateError;
    }

    public String getBirthdayError() {
        return BirthdayError;
    }

    public void setBirthdayError(String BirthdayError) {
        this.BirthdayError = BirthdayError;
    }
}
