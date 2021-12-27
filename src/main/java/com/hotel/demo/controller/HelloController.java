package com.hotel.demo.controller;

import com.hotel.demo.model.ResultModel;
import com.hotel.demo.model.StudentModel;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;

@RestController
public class HelloController {

    @RequestMapping("")
    public String sayHello() {
        return "Hello World";
    }

    @RequestMapping("student")
    public ResultModel student() {
        StudentModel student = new StudentModel();
        student.setNo("01");
        student.setName("Jack");
        return ResultModel.data(student);
    }

    @RequestMapping("students")
    public ResultModel students() {
        List<StudentModel> students = new ArrayList<>();
        for (int i = 0; i < 5; i++) {
            StudentModel student = new StudentModel();
            student.setNo("11");
            student.setName("justin");
            students.add(student);
        }
        return ResultModel.data(students);
    }
}