print("Swift Docker - All Good!")


var myTask = TodoItem(
    title: "Test"
)

print(myTask.title ?? "NO TITLE!")


myTask.changeTitle(title: "WOW!")


print(myTask.title ?? "NO TITLE!")


