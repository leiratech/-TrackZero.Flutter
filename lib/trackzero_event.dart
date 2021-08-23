part of leiratech_trackzero;

class Event {
  String emitterType;
  var emitterId;
  String name;
  var id;
  String? startTime;
  String? endTime;
  var targets = [];
  var customAttributes = {};

  ///Initializes the Event object
  ///
  ///[emitterType] - Type of the entity that emitted the event.
  ///
  ///[emitterId] - {String | int} - Id of the entity that emitted the event.
  ///
  ///[name] - Event's name.
  ///
  ///_OPTIONAL PARAMS_
  ///
  ///[id] - {String | int} - Event's id. Specifying your own Id prevents duplication if it happens and you send this event again. When not specified, it will be automatically set to a NewGuid.
  ///
  ///[startTime] - (ISO 8601) The start time of the event. If not set, it will be automatically set to the current time UTC
  ///
  ///[endTime] - (ISO 8601) The end time of the event. If not set, it will be automatically set to the current time UTC
  ///
  ///```dart
  ///Event event = new Event("User", "87717c11-ed5a...", "Checked Out")
  /// //To add an attribute to the event (Method Chainable)
  ///.addAttribute("Cart Total", 799.99)
  /// //To add an attribute that references another entity (Method Chainable)
  ///.addEntityReferencedAttribute("Item", "Product", "SKU-1234")
  /// //To add an entity that was impacted by the event (Method Chainable)
  ///.addImpactedTarget("Company", "Store A")
  /// ```
  Event(this.emitterType, this.emitterId, this.name,
      [this.id, this.startTime, this.endTime]);

  ///Adds custom attributes to the event
  ///
  ///[attribute] - Event's attribute name
  ///
  ///[value] - Event's attribute value
  Event addAttribute(String attribute, value) {
    this.customAttributes[attribute] = value;
    return this;
  }

  ///Adds custom attributes to the event that are related to another entity
  ///
  ///[attribute] - Event's attribute name
  ///
  ///[referenceType] - Related to entity type
  ///
  ///[referenceId] - {String | int} - Related to entity id
  Event addEntityReferencedAttribute(
      String attribute, String referenceType, referenceId) {
    this.customAttributes[attribute] = {
      "type": referenceType,
      "id": referenceId
    };
    return this;
  }

  ///Adds entities that were impacted by this event
  ///
  ///[impactedType] - Entity type that was impacted
  ///
  ///[impactedId] - Entity Id that was impacted
  Event addImpactedTarget(String impactedType, impactedId) {
    this.targets.add({"type": impactedType, "id": impactedId});
    return this;
  }
}
