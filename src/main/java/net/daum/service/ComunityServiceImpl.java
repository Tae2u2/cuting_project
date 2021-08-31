package net.daum.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import net.daum.dao.ComunityDAO;

@Service
public class ComunityServiceImpl implements ComunityService {
	@Inject
	private ComunityDAO comunityDao;
}
