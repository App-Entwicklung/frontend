class Chat {
  final String name, lastMessage, image, time;
  final bool isActive;

  Chat(
      {required this.name,
      required this.lastMessage,
      required this.image,
      required this.time,
      required this.isActive});
}

List chatsData = [
  Chat(
      name: "Binh Dich",
      lastMessage: "Hope you are doing well...",
      image:
          "https://cdn.pixabay.com/photo/2014/04/12/12/44/primrose-322328_960_720.jpg",
      time: "3m ago",
      isActive: false),
  Chat(
      name: "Florian Hase",
      lastMessage: "Hallo",
      image:
          "https://cdn.pixabay.com/photo/2020/07/02/07/46/exacum-5362110_960_720.jpg",
      time: "8m ago",
      isActive: true),
  Chat(
      name: "Matthias Biermanns",
      lastMessage: "Hi",
      image:
          "https://cdn.pixabay.com/photo/2020/07/01/07/48/begonias-5358770__340.jpg",
      time: "20m ago",
      isActive: false),
  Chat(
      name: "Patrick Vollstedt",
      lastMessage: "Ja",
      image:
          "https://cdn.pixabay.com/photo/2014/01/23/18/15/arrangement-250618_960_720.jpg",
      time: "2h ago",
      isActive: true),
  Chat(
      name: "Rebekka Miguez",
      lastMessage: "Wie gehts?",
      image:
          "https://cdn.pixabay.com/photo/2019/03/25/18/37/azalea-4081033__340.jpg",
      time: "5h ago",
      isActive: false) 
];
