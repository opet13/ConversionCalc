# Multi-Paradigm Programming
import pandas as pd
from functools import reduce

class Student:
    def __init__(self, name, student_id, courses, grades):
        self.name = name
        self.student_id = student_id
        self.courses = courses
        self.grades = grades

    def average_grade(self):
        avg = sum(self.grades.values()) / len(self.grades)
        return round(avg, 2) 

    def predict_performance(self):
        avg = self.average_grade()
        if avg >= 85:
            return "Excellent"
        elif avg >= 70:
            return "Good"
        elif avg >= 50:
            return "Average"
        else:
            return "Poor"

# Functional Programming
students = [
    Student("Amirul", "S001", ["Math", "Science", "English"], {"Math": 88, "Science": 90, "English": 85}),
    Student("Adi", "S002", ["Math", "Science", "English"], {"Math": 60, "Science": 65, "English": 58}),
    Student("Haziq", "S003", ["Math", "Science", "English"], {"Math": 45, "Science": 50, "English": 48})
]

# Functional style operations: map() to get average grades
averages = list(map(lambda s: (s.name, s.average_grade()), students))

# Functional style operations: filter() to find top performers
top_students = list(filter(lambda s: s.average_grade() >= 80, students))

# Functional style operations: reduce() to find overall average
overall_avg = reduce(lambda a, b: a + b, [s.average_grade() for s in students]) / len(students)
overall_avg = round(overall_avg, 2)

# Pandas Library
data = {
    "Name": [s.name for s in students],
    "Average": [s.average_grade() for s in students],
    "Performance": [s.predict_performance() for s in students]
}
df = pd.DataFrame(data)

print("================================")
print("  STUDENT PERFORMANCE REPORT")
print("================================")
print(df.to_string(index=True))
print("================================")
print(f"Overall Average Grade : {overall_avg}")
print(f"Top Performers        : {[s.name for s in top_students]}")
print("================================")
