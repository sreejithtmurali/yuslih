class Worker {
  final String id;
  final String password;
  final String adhharno;
  final String phone;
  final String dropdownValue;
  final String name;
  final int amt;
  final String selectedCategory;
  final String email;
  final String url;

  Worker({
    required this.id,
    required this.password,
    required this.adhharno,
    required this.phone,
    required this.dropdownValue,
    required this.name,
    required this.amt,
    required this.selectedCategory,
    required this.email,
    required this.url,
  });
}

List<Worker> convertMapToList(Map<String, Map<String, dynamic>> map) {
  List<Worker> workers = [];

  map.forEach((key, value) {
    workers.add(
      Worker(
        id: key,
        password: value['password'],
        adhharno: value['adhharno'],
        phone: value['phone'],
        dropdownValue: value['dropdownValue'],
        name: value['name'],
        amt: value['amt'],
        selectedCategory: value['selectedcategory'],
        email: value['email'],
        url: value['url'],
      ),
    );
  });

  return workers;
}
