package spring.controller;


import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import spring.model.LessonUnitBean;
import spring.repository.UnitRepository;

@Controller
@RequestMapping(value = "/unit")
public class UnitController {
	
	@Autowired
	UnitRepository unitrepo;
	
	@GetMapping(value = "/showunit")
	public String unit(Model m) {
		int id = 1;
		ArrayList<LessonUnitBean> lstLessonUnit = (ArrayList<LessonUnitBean>) unitrepo.selectLessonUnit(id);
		m.addAttribute("lstLessonUnit", lstLessonUnit);
		return "unit";
	}
}
