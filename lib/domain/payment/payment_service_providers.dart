enum PaymentServiceProviders {
  mockPSP;

  static PaymentServiceProviders? fromString(String value) {
    switch (value) {
      case "MOCK_PSP":
        return PaymentServiceProviders.mockPSP;
    }
    return null;
  }
}
