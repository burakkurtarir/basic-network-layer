View tarafı sadece UI state'ine bakar(Loading, Error, Success gibi olaylar).
Cubit tarafı veya viewmodel(view sayfasındaki fonksiyonların yazıldığı sayfa) ise result success mi fail mi diye bakar. Success ise datayı set eder, Error ise UI state'ini error yapar
Service tarafı da result success mi fail mi diye bakar. Response veya NetworkError alır. Response datasını parse eder ve cubit tarafına data veya NetworkError döndürür
Network tarafı da dio response veya dio error alır. Bunları bizim custom modellerimize dönüştürür ve geriye ya ResponseModel ya da NetworkError döndürür.