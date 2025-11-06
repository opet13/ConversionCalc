student('Adi', s101).
student('Mirul', s102).
student('Haziq', s103).

enrolled(s101, cs101).
enrolled(s101, cs102).
enrolled(s101, cs103).

enrolled(s102, cs101).
enrolled(s102, cs102).

enrolled(s103, cs101).
enrolled(s103, cs102).
enrolled(s103, cs103).
enrolled(s103, cs104).

prerequisite(cs102, cs101).
prerequisite(cs103, cs102).
prerequisite(cs104, cs103).
prerequisite(cs105, cs104).

eligible(StudentID, CourseCode) :-
    \+ enrolled(StudentID, CourseCode),
    findall(Prereq, prerequisite(CourseCode, Prereq), Prereqs),
    forall(member(P, Prereqs), enrolled(StudentID, P)).

recommend(StudentID, CourseCode) :-
    prerequisite(CourseCode, _),
    eligible(StudentID, CourseCode).

required_courses([cs101, cs102, cs103, cs104]).

eligible_for_graduation(StudentID) :-
    required_courses(Reqs),
    forall(member(C, Reqs), enrolled(StudentID, C)).
