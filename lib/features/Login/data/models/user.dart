import 'package:aji/features/Login/data/models/sbus.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  @JsonKey(name: "sbus")
  final List<Sbus>? sbus;
  @JsonKey(name: "businessType")
  final String? businessType;
  @JsonKey(name: "ownershipType")
  final String? ownershipType;
  @JsonKey(name: "address")
  final String? address;
  @JsonKey(name: "deliveryAddress")
  final List<dynamic>? deliveryAddress;
  @JsonKey(name: "phoneNumber")
  late final String? phoneNumber;
  @JsonKey(name: "email")
  final String? email;
  @JsonKey(name: "marketType")
  final String? marketType;
  @JsonKey(name: "province")
  final String? province;
  @JsonKey(name: "periphery")
  final String? periphery;
  @JsonKey(name: "blankChequeFile")
  final String? blankChequeFile;
  @JsonKey(name: "agreementPaperFile")
  final String? agreementPaperFile;
  @JsonKey(name: "tradeLicenseFile")
  final String? tradeLicenseFile;
  @JsonKey(name: "tinCertificateFile")
  final String? tinCertificateFile;
  @JsonKey(name: "binCertificateFile")
  final String? binCertificateFile;
  @JsonKey(name: "etinReturnFile")
  final String? etinReturnFile;
  @JsonKey(name: "bankStatementFile")
  final String? bankStatementFile;
  @JsonKey(name: "rentalAgreementFile")
  final String? rentalAgreementFile;
  @JsonKey(name: "bankGuarantyFile")
  final String? bankGuarantyFile;
  @JsonKey(name: "role")
  final String? role;
  @JsonKey(name: "password")
  final String? password;
  @JsonKey(name: "status")
  final String? status;
  @JsonKey(name: "onlineStatus")
  final String? onlineStatus;
  @JsonKey(name: "_id")
  final String? id;
  @JsonKey(name: "location")
  final String? location;
  @JsonKey(name: "dealerCode")
  final String? dealerCode;
  @JsonKey(name: "organizationName")
  final String? organizationName;
  @JsonKey(name: "divisionId")
  final String? divisionId;
  @JsonKey(name: "districtId")
  final String? districtId;
  @JsonKey(name: "policeStationId")
  final String? policeStationId;
  @JsonKey(name: "regionId")
  final String? regionId;
  @JsonKey(name: "areaId")
  final String? areaId;
  @JsonKey(name: "territoryId")
  final String? territoryId;
  @JsonKey(name: "bankName")
  final String? bankName;
  @JsonKey(name: "accountType")
  final String? accountType;
  @JsonKey(name: "accountTitle")
  final String? accountTitle;
  @JsonKey(name: "accountNumber")
  final String? accountNumber;
  @JsonKey(name: "branchName")
  final String? branchName;
  @JsonKey(name: "routingNumber")
  final String? routingNumber;
  @JsonKey(name: "creditLimit")
  final dynamic creditLimit;
  @JsonKey(name: "creditLimitPerOrder")
  final dynamic creditLimitPerOrder;
  @JsonKey(name: "creditLimitExpireDate")
  final dynamic creditLimitExpireDate;
  @JsonKey(name: "bankGuarantyAmount")
  final dynamic bankGuarantyAmount;
  @JsonKey(name: "bankGuarantyExpireDate")
  final dynamic bankGuarantyExpireDate;
  @JsonKey(name: "blankChequeAmount")
  final dynamic blankChequeAmount;
  @JsonKey(name: "blankChequeExpireDate")
  final dynamic blankChequeExpireDate;
  @JsonKey(name: "propietorInfo")
  final List<dynamic>? propietorInfo;
  @JsonKey(name: "loginLog")
  final List<dynamic>? loginLog;
  @JsonKey(name: "createdAt")
  final DateTime? createdAt;
  @JsonKey(name: "updatedAt")
  final DateTime? updatedAt;
  @JsonKey(name: "__v")
  final int? v;
  @JsonKey(name: "passwordResetExpires")
  final DateTime? passwordResetExpires;
  @JsonKey(name: "passwordResetToken")
  final String? passwordResetToken;

  User({
    this.sbus,
    this.businessType,
    this.ownershipType,
    this.address,
    this.deliveryAddress,
    this.phoneNumber,
    this.email,
    this.marketType,
    this.province,
    this.periphery,
    this.blankChequeFile,
    this.agreementPaperFile,
    this.tradeLicenseFile,
    this.tinCertificateFile,
    this.binCertificateFile,
    this.etinReturnFile,
    this.bankStatementFile,
    this.rentalAgreementFile,
    this.bankGuarantyFile,
    this.role,
    this.password,
    this.status,
    this.onlineStatus,
    this.id,
    this.location,
    this.dealerCode,
    this.organizationName,
    this.divisionId,
    this.districtId,
    this.policeStationId,
    this.regionId,
    this.areaId,
    this.territoryId,
    this.bankName,
    this.accountType,
    this.accountTitle,
    this.accountNumber,
    this.branchName,
    this.routingNumber,
    this.creditLimit,
    this.creditLimitPerOrder,
    this.creditLimitExpireDate,
    this.bankGuarantyAmount,
    this.bankGuarantyExpireDate,
    this.blankChequeAmount,
    this.blankChequeExpireDate,
    this.propietorInfo,
    this.loginLog,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.passwordResetExpires,
    this.passwordResetToken,
  });

  User copyWith({
    List<Sbus>? sbus,
    String? businessType,
    String? ownershipType,
    String? address,
    List<dynamic>? deliveryAddress,
    String? phoneNumber,
    String? email,
    String? marketType,
    String? province,
    String? periphery,
    String? blankChequeFile,
    String? agreementPaperFile,
    String? tradeLicenseFile,
    String? tinCertificateFile,
    String? binCertificateFile,
    String? etinReturnFile,
    String? bankStatementFile,
    String? rentalAgreementFile,
    String? bankGuarantyFile,
    String? role,
    String? password,
    String? status,
    String? onlineStatus,
    String? id,
    String? location,
    String? dealerCode,
    String? organizationName,
    String? divisionId,
    String? districtId,
    String? policeStationId,
    String? regionId,
    String? areaId,
    String? territoryId,
    String? bankName,
    String? accountType,
    String? accountTitle,
    String? accountNumber,
    String? branchName,
    String? routingNumber,
    dynamic creditLimit,
    dynamic creditLimitPerOrder,
    dynamic creditLimitExpireDate,
    dynamic bankGuarantyAmount,
    dynamic bankGuarantyExpireDate,
    dynamic blankChequeAmount,
    dynamic blankChequeExpireDate,
    List<dynamic>? propietorInfo,
    List<dynamic>? loginLog,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? v,
    DateTime? passwordResetExpires,
    String? passwordResetToken,
  }) =>
      User(
        sbus: sbus ?? this.sbus,
        businessType: businessType ?? this.businessType,
        ownershipType: ownershipType ?? this.ownershipType,
        address: address ?? this.address,
        deliveryAddress: deliveryAddress ?? this.deliveryAddress,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        email: email ?? this.email,
        marketType: marketType ?? this.marketType,
        province: province ?? this.province,
        periphery: periphery ?? this.periphery,
        blankChequeFile: blankChequeFile ?? this.blankChequeFile,
        agreementPaperFile: agreementPaperFile ?? this.agreementPaperFile,
        tradeLicenseFile: tradeLicenseFile ?? this.tradeLicenseFile,
        tinCertificateFile: tinCertificateFile ?? this.tinCertificateFile,
        binCertificateFile: binCertificateFile ?? this.binCertificateFile,
        etinReturnFile: etinReturnFile ?? this.etinReturnFile,
        bankStatementFile: bankStatementFile ?? this.bankStatementFile,
        rentalAgreementFile: rentalAgreementFile ?? this.rentalAgreementFile,
        bankGuarantyFile: bankGuarantyFile ?? this.bankGuarantyFile,
        role: role ?? this.role,
        password: password ?? this.password,
        status: status ?? this.status,
        onlineStatus: onlineStatus ?? this.onlineStatus,
        id: id ?? this.id,
        location: location ?? this.location,
        dealerCode: dealerCode ?? this.dealerCode,
        organizationName: organizationName ?? this.organizationName,
        divisionId: divisionId ?? this.divisionId,
        districtId: districtId ?? this.districtId,
        policeStationId: policeStationId ?? this.policeStationId,
        regionId: regionId ?? this.regionId,
        areaId: areaId ?? this.areaId,
        territoryId: territoryId ?? this.territoryId,
        bankName: bankName ?? this.bankName,
        accountType: accountType ?? this.accountType,
        accountTitle: accountTitle ?? this.accountTitle,
        accountNumber: accountNumber ?? this.accountNumber,
        branchName: branchName ?? this.branchName,
        routingNumber: routingNumber ?? this.routingNumber,
        creditLimit: creditLimit ?? this.creditLimit,
        creditLimitPerOrder: creditLimitPerOrder ?? this.creditLimitPerOrder,
        creditLimitExpireDate: creditLimitExpireDate ?? this.creditLimitExpireDate,
        bankGuarantyAmount: bankGuarantyAmount ?? this.bankGuarantyAmount,
        bankGuarantyExpireDate: bankGuarantyExpireDate ?? this.bankGuarantyExpireDate,
        blankChequeAmount: blankChequeAmount ?? this.blankChequeAmount,
        blankChequeExpireDate: blankChequeExpireDate ?? this.blankChequeExpireDate,
        propietorInfo: propietorInfo ?? this.propietorInfo,
        loginLog: loginLog ?? this.loginLog,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        v: v ?? this.v,
        passwordResetExpires: passwordResetExpires ?? this.passwordResetExpires,
        passwordResetToken: passwordResetToken ?? this.passwordResetToken,
      );

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}