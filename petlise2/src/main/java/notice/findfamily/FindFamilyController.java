package notice.findfamily;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class FindFamilyController {

	@GetMapping("/findfamily")
	public String getFamily(Model model) {
		model.addAttribute("title", "가족찾기");

		return "notice/findfamilyMain";
	}
}
