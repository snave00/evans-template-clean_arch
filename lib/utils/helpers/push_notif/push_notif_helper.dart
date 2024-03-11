// import 'dart:math';

// import '../../../features/settings/domain/entities/notif_message_entity.dart';
// import '../uuid_generator.dart';

// class PushNotifHelper {
//   NotifMessageEntity getRandomMessage() {
//     final Random random = Random();
//     final int randomIndex = random.nextInt(reminderMessages.length);
//     return reminderMessages[randomIndex];
//   }
// }

// // TODO: Move Strings to String.constants
// final reminderMessages = [
//   NotifMessageEntity(
//     messageId: IdGenerator.generateId,
//     title: "Forgot to log your expense?",
//     subtitle: "Don't leave your money hanging – Record your expenses now 💰",
//   ),
//   NotifMessageEntity(
//     messageId: IdGenerator.generateId,
//     title: "Expense alert 🚨",
//     subtitle: "Time to track your spending and keep that budget on point",
//   ),
//   NotifMessageEntity(
//     messageId: IdGenerator.generateId,
//     title: "Income check-in",
//     subtitle: "Your money's waiting – log your income today 📊",
//   ),
//   NotifMessageEntity(
//     messageId: IdGenerator.generateId,
//     title: "Expense reminder 📝",
//     subtitle: "Don't forget to record your spending – every cent counts",
//   ),
//   NotifMessageEntity(
//     messageId: IdGenerator.generateId,
//     title: "Money in, Money out",
//     subtitle: "Track your income and expenses for a financially fit future! 💪",
//   ),
//   NotifMessageEntity(
//     messageId: IdGenerator.generateId,
//     title: "Cashflow Alert 📆",
//     subtitle: "Time to update your Moneyfest – keep tabs on every dollar!",
//   ),
//   NotifMessageEntity(
//     messageId: IdGenerator.generateId,
//     title: "Income & Expense time ⏰",
//     subtitle: "Stay in control of your finances – log your money movements",
//   ),
//   NotifMessageEntity(
//     messageId: IdGenerator.generateId,
//     title: "Expense logging reminder",
//     subtitle: "Don't miss a beat – record your expenses and stay on budget 📈",
//   ),
//   NotifMessageEntity(
//     messageId: IdGenerator.generateId,
//     title: "Moneyfest Alert",
//     subtitle: "Track your financial journey – log income and expenses today",
//   ),
//   NotifMessageEntity(
//     messageId: IdGenerator.generateId,
//     title: "Income & Expense checkpoint",
//     subtitle: "It's time to document your money moves – keep it up! 💼",
//   ),
//   NotifMessageEntity(
//     messageId: IdGenerator.generateId,
//     title: "Money matters",
//     subtitle: "Don't forget to update your finances today",
//   ),
//   NotifMessageEntity(
//     messageId: IdGenerator.generateId,
//     title: "Financial check-in",
//     subtitle: "Let's keep your money game strong! 💪",
//   ),
//   NotifMessageEntity(
//     messageId: IdGenerator.generateId,
//     title: "Your Moneyfest buddy",
//     subtitle: "Time to give your wallet some love! ❤️",
//   ),
//   NotifMessageEntity(
//     messageId: IdGenerator.generateId,
//     title: "Cashflow reminder",
//     subtitle: "Stay on top of your financial game 🚀",
//   ),
//   NotifMessageEntity(
//     messageId: IdGenerator.generateId,
//     title: "Just received your salary?",
//     subtitle: "Let's make sure you're using it wisely!",
//   ),
//   NotifMessageEntity(
//     messageId: IdGenerator.generateId,
//     title: "Planning to spend on something?",
//     subtitle: "Let's check first!",
//   ),
//   NotifMessageEntity(
//     messageId: IdGenerator.generateId,
//     title: "Planning for a date?",
//     subtitle: "Let's budget it out first!",
//   ),
//   NotifMessageEntity(
//     messageId: IdGenerator.generateId,
//     title: "Planning for a travel?",
//     subtitle: "Let's budget it out first!",
//   ),
//   NotifMessageEntity(
//     messageId: IdGenerator.generateId,
//     title: "Money management made easy",
//     subtitle: "It's time to balance the books! 📚",
//   ),
//   NotifMessageEntity(
//     messageId: IdGenerator.generateId,
//     title: "Dough-licious finance reminder",
//     subtitle: "Keep tabs on your dough! 🍞",
//   ),
//   NotifMessageEntity(
//     messageId: IdGenerator.generateId,
//     title: "Financial fitness alert",
//     subtitle: "Let's get your finances in shape 💪",
//   ),
//   NotifMessageEntity(
//     messageId: IdGenerator.generateId,
//     title: "Money watch",
//     subtitle: "Time to monitor your financial health 👀",
//   ),
//   NotifMessageEntity(
//     messageId: IdGenerator.generateId,
//     title: "Counting coins",
//     subtitle: "It's time to update your moneyfest!",
//   ),
//   NotifMessageEntity(
//     messageId: IdGenerator.generateId,
//     title: "Don't fear your expenses",
//     subtitle:
//         "Your expenses hold secrets! Did you know tracking them boosts savings by 20%? Keep an eye on your spending.",
//   ),
//   NotifMessageEntity(
//     messageId: IdGenerator.generateId,
//     title: "No worries, just finances",
//     subtitle:
//         "Don't stress about spending! Tracking finances means wiser savings.",
//   ),
//   NotifMessageEntity(
//     messageId: IdGenerator.generateId,
//     title: "Learn from your finances",
//     subtitle:
//         "Don't stress about spending! Tracking finances means wiser savings.",
//   ),
//   NotifMessageEntity(
//     messageId: IdGenerator.generateId,
//     title: "Finances are friends, not foes",
//     subtitle:
//         "Time to check your finances. It's not intimidating. It's about learning and growing.",
//   ),
//   NotifMessageEntity(
//     messageId: IdGenerator.generateId,
//     title: "Don't forget your finance update",
//     subtitle:
//         "Don't let tracking finances intimidate you. It's about progress, not pressure.",
//   ),
// ];
