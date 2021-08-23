part of leiratech_trackzero;

class Entity {
  String type;
  var id;
  var customAttributes = {};

  ///Initializes the Entity object
  ///
  ///[type] - Entity's type
  ///
  ///[id] - {String | int} - Entity's id
  ///
  ///```dart
  ///Entity entity = new Entity("User", "87717c11-ed5a...")
  /// //Adds an attribute to the entity (Method Chainable)
  ///.addAttribute("Name", "Sam Smith")
  /// //Adds an attribute that references another entity (Method Chainable)
  /// .addEntityReferencedAttribute("Location", "Country", "US");
  /// ```
  Entity(this.type, this.id);

  ///Adds custom attributes to the entity
  ///
  ///[attribute] - Entity's attribute name
  ///
  ///[value] - Entity's attribute value
  Entity addAttribute(String attribute, value) {
    this.customAttributes[attribute] = value;
    return this;
  }

  ///Adds custom attributes to the entity that are related to another entity
  ///
  ///[attribute] - Entity's attribute name
  ///
  ///[referenceType] - Related to entity type
  ///
  ///[referenceId] - {String | int} - Related to entity id
  Entity addEntityReferencedAttribute(
      String attribute, String referenceType, referenceId) {
    this.customAttributes[attribute] = {
      "type": referenceType,
      "id": referenceId
    };
    return this;
  }
}
