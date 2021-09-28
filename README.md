[![#](https://img.shields.io/npm/v/@leiratech/trackzero-js)](https://www.npmjs.com/package/@leiratech/trackzero-js) [![#](https://img.shields.io/pub/v/leiratech_trackzero)](https://pub.dev/packages/leiratech_trackzero) [![#](https://img.shields.io/nuget/v/Leira.TrackZero.NetCore.svg)](https://www.nuget.org/packages/Leira.TrackZero.NetCore)

![#](https://img.shields.io/npm/l/@leiratech/trackzero-js)

# Usage

### Initialization

Initialize the TrackZeroClient instance by passing in your API key before using any of the methods.

```dart
var instance = new TrackZeroClient("API-KEY");
```

# Getting Started

### TrackZero Instance

After initializing the TrackZero instance, you could get the instance anywhere in your project

```dart
var instance = TrackZeroClient.getInstance();
```

## Entity

Entities are objects that contain data. It can represent any object in the real world. Each entity is defined by it’s Type and Id.

#### Create an Entity object

```dart
///Initializes the Entity object
///
///[type] - Entity's type
///[id] - {String | int} - Entity's id

Entity entity = new Entity("type", "id");
```

#### Add Attributes

```dart
///Adds custom attributes to the entity
///
///[attribute] - Entity's attribute name
///[value] - Entity's attribute value

entity.addAttribute("attribute", "value");
```

#### Add Attributes Referencing Other Entities

```dart
///Adds custom attributes to the entity that are related to another entity
///
///[attribute] - Entity's attribute name
///[referenceType] - Related to entity type
///[referenceId] - {String | int} - Related to entity id

entity.addEntityReferencedAttribute(
  "attribute",
  "referenceType",
  "referenceId"
);
```

#### Track Entity

```dart
///Creates/Updates the Entity
await instance.upsertEntity(entity);
```

> **Note:** Upsert _(Update/Insert)_ is applied when sending the entity. So, if the the entity of type X with id Y already exists, then it gets updated, else a new entity is created. This also applies to the entity's referenced attributes in `addEntityReferencedAttribute`.

#### Complete Entity Example

```dart
Entity user = new Entity("User", "USER_ID")
  .addAttribute("Name", "Sam Smith")
  .addAttribute("Date Of Birth", DateTime.utc(1990, 12, 23).toIso8601String()) //Make sure dates are in ISO8601 String
  .addEntityReferencedAttribute("Location", "Country", "US");

await instance.upsertEntity(user);
```

#### Delete Entity

> :warning: &nbsp; Deleting an entity will delete all events emitted by this entity.

> :exclamation: &nbsp; Deletion is permanent and cannot be undone.

```dart
///Deletes the Entity
///
///[type] - type of entity to be deleted
///[id] - {String | int} - id of the entity to be deleted

await instance.deleteEntity("type", "id");
```

## Event

Events are considered as actions that are emitted from an entity and impact another entity

#### Create an Event object

```dart
///Initializes the Event object
///
///[emitterType] - the entity type that emitted the event
///[emitterId] - {String | int} - the entity id that emitted the event
///[name] - the event name
///
///_OPTIONAL PARAMS_
///
///[id] - {String | int} - the event id.
///[startTime] - (ISO 8601) The start time of the event.
///[endTime] - (ISO 8601) The end time of the event.

Event event = new Event(
  "emitterType",
  "emitterId",
  "name",
  ["id",
  "startTime",
  "endTime"]
);
```

> **Note:** `startTime` and `endTime` are important, always try to set them. If both are not supplied, both will be set to the current time. If one is not supplied, it will be set to be equal to the other.

> **Note:** The `id` of the event is important if you plan on changing or adding more information to the event later. You will need the `id` to make those changes.

#### Add Attributes

```dart
///Adds custom attributes to the event
///
///[attribute] - Event's attribute name
///[value] - Event's attribute value

event.addAttribute("attribute", "value");
```

#### Add Attributes Referencing Other Entities

```dart
///Adds custom attributes to the event that are related to another entity
///
///[attribute] - Event's attribute name
///[referenceType] - Related to entity type
///[referenceId] - {String | int} - Related to entity id

event.addEntityReferencedAttribute("attribute", "referenceType", "referenceId");
```

#### Add Impacted Entities

```dart
///Adds entities that were impacted by this event
///
///[impactedType] - Entity type that was impacted
///[impactedId] - Entity Id that was impacted

event.addImpactedTarget("impactedType", "impactedId");
```

#### Track Event

```dart
///Creates/Updates the Event
await instance.upsertEvent(event);
```

> **Note:** Like the Entity object, upsert _(Update/Insert)_ is applied to the event's emitter, entity's referenced attributes in `addEntityReferencedAttribute`, and the impacted entities in `addImpactedTarget`.

#### Complete Event Example

```dart
Event checked = new Event("User", "USER_ID", "Checked Out")
  .addAttribute("Cart Total", 99.95)
  .addEntityReferencedAttribute("Item", "Product", "SKU-1234")
  .addImpactedTarget("Warehouse", "WH-BLVD-652");

await instance.upsertEvent(checked);
```

#### Delete Event

> :exclamation: &nbsp; Deletion is permanent and cannot be undone.

```dart
///Deletes the Event
///
///[type] - event type/name to be deleted
///[id] - {String | int} - id of the event to be deleted

await instance.deleteEvent("type", "id");
```

## Smart Configuration

Customizable configurations based on certain conditions checked across a selection of your saved reports on the portal

```dart
///Queries the configuration based on the groupId
///
///[groupId] - the configuration group Id (Portal > Smart Configuration Page)
///[identifier] - {String | int} - the value you want to check the conditions on

await instance.queryConfiguration("groupId", "identifier");
```

# Resources

[Changelog](./CHANGELOG.md)

# License

MIT
