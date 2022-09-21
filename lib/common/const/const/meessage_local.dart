class MessageRefactorLocal {
  final String successAddedItemTitle,
      failedAddItemTitle,
      successEditItemTitle,
      failedEditItemTitle,
      successRemovedItemTitle,
      failedRemoveItemTitle,
      failedGetItemsTitle;
  final String? successAddedItemDescription,
      failedAddItemDescription,
      successEditItemDescription,
      failedEditItemDescription,
      successRemovedItemDescription,
      failedRemoveItemDescription,
      failedGetItemsDescription;

  final LocalType type;

  MessageRefactorLocal(
      {required this.type,
      String? successAddedItemDescription,
      String? failedAddItemDescription,
      String? successEditItemDescription,
      String? failedEditItemDescription,
      String? successRemovedItemDescription,
      String? failedRemoveItemDescription,
      String? failedGetItemsDescription})
      : successAddedItemTitle =
            '${_MessageLocal.successAddedItem.information.title} ${type.type}',
        failedAddItemTitle =
            '${_MessageLocal.failedAddItem.information.title} ${type.type}',
        successEditItemTitle =
            '${_MessageLocal.successEditItem.information.title} ${type.type}',
        failedEditItemTitle =
            '${_MessageLocal.failedEditItem.information.title} ${type.type}',
        successRemovedItemTitle =
            '${_MessageLocal.successRemovedItem.information.title} ${type.type}',
        failedRemoveItemTitle =
            '${_MessageLocal.failedRemoveItem.information.title} ${type.type}',
        failedGetItemsTitle =
            '${_MessageLocal.failedGetItems.information.title} ${type.type}',
        successAddedItemDescription = successAddedItemDescription ??
            '${_MessageLocal.successAddedItem.information.description} ${type.type}',
        failedAddItemDescription = failedAddItemDescription ??
            '${_MessageLocal.failedAddItem.information.description} ${type.type}',
        successEditItemDescription = successEditItemDescription ??
            '${_MessageLocal.successEditItem.information.description} ${type.type}',
        failedEditItemDescription = failedEditItemDescription ??
            '${_MessageLocal.failedEditItem.information.description} ${type.type}',
        successRemovedItemDescription = successRemovedItemDescription ??
            '${_MessageLocal.successRemovedItem.information.description} ${type.type}',
        failedRemoveItemDescription = failedRemoveItemDescription ??
            '${_MessageLocal.failedRemoveItem.information.description} ${type.type}',
        failedGetItemsDescription = failedGetItemsDescription ??
            '${_MessageLocal.failedGetItems.information.description} ${type.type}';
}

enum LocalType {
  cart(type: 'cart'),
  favourite(type: 'favorite'),
  address(type: 'address');

  final String type;

  const LocalType({required this.type});
}

enum _MessageLocal {
  successAddedItem(
      information:
          Information(title: 'Success Added Item To ', description: '')),
  failedAddItem(
      information:
          Information(title: 'Failed Added Item To ', description: '')),
  successEditItem(
      information: Information(title: 'Success Edit  Item  ', description: '')),
  failedEditItem(
      information: Information(title: 'Failed Edit Item  ', description: '')),
  successRemovedItem(
      information:
          Information(title: 'Success Removed Item From ', description: '')),
  failedRemoveItem(
      information:
          Information(title: 'Failed Remove Item From ', description: '')),
  failedGetItems(
      information: Information(title: 'Failed Get  Item ', description: ''));

  final Information information;

  const _MessageLocal({required this.information});
}

class Information {
  final String title, description;

  const Information({required this.title, required this.description});
}
