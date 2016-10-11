package fi.sjs.domore.controller;


import java.util.ArrayList;
import java.util.List;
import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import fi.sjs.domore.bean.KayttajaImpl;
import fi.sjs.domore.bean.Tapahtuma;
import fi.sjs.domore.dao.KayttajaDAO;
import fi.sjs.domore.dao.TapahtumaDAO;


@Controller
@RequestMapping (value="/")
public class TapahtumaController {
	
	@Inject
	private TapahtumaDAO dao;
	
	@Inject
	private KayttajaDAO kDao;
	
	//Listaa kaikki tapahtumat
		@RequestMapping(value="/", method=RequestMethod.GET)
		public String getList(Model model) {
			List<Tapahtuma> tapahtumat = new ArrayList<Tapahtuma>(dao.haeKaikki());
			List<KayttajaImpl> osallistujat = new ArrayList<KayttajaImpl>(kDao.haeKaikki());
			model.addAttribute("tapahtumat", tapahtumat);
			model.addAttribute("osallistujat", osallistujat);
			//tyhj� k�ytt�j� osallistumisformia varten
			KayttajaImpl kayttaja = new KayttajaImpl();
			model.addAttribute("kayttaja", kayttaja);
			
			return "tapahtumat";
		}
		
}
