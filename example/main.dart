import 'package:leiratech_trackzero/leiratech_trackzero.dart';

void main() {
  //--------------- TrackZero Client ---------------//

  //Create an instance of TrackZero
  TrackZeroClient instance = new TrackZeroClient("API-KEY");

  //After Creating the instance, you could get the instance anywhere by
  instance = TrackZeroClient.getInstance();

  //--------------- Entity ---------------//

  //Create an Entity
  Entity user = new Entity("User", 1)
      .addAttribute("Name", "Sam Smith")
      //Make Sure the date string is in ISO8601 format
      .addAttribute(
          "Date Of Birth", DateTime.utc(1990, 12, 23).toIso8601String())
      .addEntityReferencedAttribute("Location", "Country", "US");

  //Creates/Updates the entity
  setEntity() async {
    Response res = await instance.upsertEntity(user);
    print(res.toString());
  }

  setEntity();

  //Delete an Entity
  deleteEntity() async {
    Response res = await instance.deleteEntity("User", 1);
    print(res.toString());
  }

  deleteEntity();

  //--------------- Analytics Space ---------------//

  //Get the Space Portal Session
  getSession() async {
    Response res = await instance.getSession(123);
    print(res.toString());
  }

  getSession();
}
