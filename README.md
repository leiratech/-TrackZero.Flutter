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

> :exclamation: &nbsp; Deletion is permanent and cannot be undone.

```dart
///Deletes the Entity
///
///[type] - type of entity to be deleted
///[id] - {String | int} - id of the entity to be deleted

await instance.deleteEntity("type", "id");
```

## Analytics Spaces

Each analytics space represents a separate database storing analytical data relevant to a specific subject/entity _user defined_.

Each analytics space is able to build reports and dahsboards in TrackZero's space portal.

#### Get a Space Portal Session

```dart
///Creates a space portal session
///
///[analyticsSpaceId] - the analytics space id
///
///[ttl] - (in seconds) - default set to 3600 - time to live, when the session expires

await instance.getSession(analyticsSpaceId, ttl);
```

# Resources

[Changelog](./CHANGELOG.md)

# License

MIT
