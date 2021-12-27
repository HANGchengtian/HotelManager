package com.hotel.demo.controller;

import com.hotel.demo.entity.StudentEntity;
import com.hotel.demo.model.ResultModel;
import com.hotel.demo.service.StudentService;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.validation.Valid;

@RestController
@RequestMapping("student")
public class StudentController {

    @Resource
    StudentService service;

    // insert
    @PostMapping("")
    public ResultModel insert(
            @Valid @RequestBody StudentEntity entity,
            BindingResult result
    ) {
        if (result.hasErrors()) {
            return ResultModel.error(result.getAllErrors().get(0).getDefaultMessage());
        }
        service.save(entity);
        return ResultModel.data("OK");
    }

    // update
    @PatchMapping("")
    public ResultModel update(
            @Valid @RequestBody StudentEntity entity,
            BindingResult result
    ) {
        if (result.hasErrors()) {
            return ResultModel.error(result.getAllErrors().get(0).getDefaultMessage());
        }
        if (service.get(entity.getId()) != null) {
            service.save(entity);
            return ResultModel.data("OK");
        }
        return ResultModel.error("ID 不存在");

    }

    // delete
    @DeleteMapping("{id}")
    public ResultModel delete(@PathVariable Long id) {
        StudentEntity entity = service.get(id);
        if (entity != null) {
            service.delete(entity);
            return ResultModel.data("OK");
        }
        return ResultModel.error("ID 不存在");

    }

    // select One
    @GetMapping("{id}")
    public ResultModel getOne(@PathVariable Long id) {
        StudentEntity entity = service.get(id);
        if (entity != null) {
            return ResultModel.data(entity);
        }
        return ResultModel.error("ID 不存在");

    }

    // select All
    @GetMapping("")
    public ResultModel getAll() {
        return ResultModel.data(service.all());
    }
}