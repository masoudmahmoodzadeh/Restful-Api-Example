# Restful api Example

developed with **Flutter**

## Technologies

- **Clean Architecture**
- **Binance Api**
- **Handling Error HTTP**
- **[GetX](https://pub.dev/packages/get)**
- **[Http package](https://pub.dev/packages/http)**
- **[Pie Chart](https://pub.dev/packages/pie_chart)**
- **[Date Format](https://pub.dev/packages/date_format)**

## Usage

Each request must inherit from the **BaseAppRequest**

~~~dart
class ListCryptoRequest extends BaseAppRequest {
  @override
  String getApiAddress() {
    return "/api/v3/ticker/price";
  }

  @override
  MethodType getApiMethod() {
    return MethodType.get;
  }

  @override
  ListCryptoRequest fromJson(Map<String, dynamic> json) {
    return ListCryptoRequest();
  }

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}
~~~ 

then send to **ApiManager**


~~~ dart
ApiManager apiManager = ApiManager();
    apiManager.sendRequest(
      request: ListCryptoRequest(),
      onSuccess: (json) {
        List<ListCryptoResponse> data = (json as List)
            .map((item) => ListCryptoResponse.fromJson(item))
            .toList();
        callback(data);
      },
      errorCallback: errorCallback,
    );
~~~



## Screenshots

![Screenshot-01](/screenshots/screenshot-01.png)

![Screenshot-02](/screenshots/screenshot-02.png)
