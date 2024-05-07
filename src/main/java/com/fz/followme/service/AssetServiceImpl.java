package com.fz.followme.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.fz.followme.dao.AssetDao;
import com.fz.followme.dto.AssetDto;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class AssetServiceImpl implements AssetService {

	private final AssetDao assetDao;


	@Override
	public List<AssetDto> selectcarList() {
		return assetDao.selectcarList();
	}


	@Override
	public int insertCar(AssetDto ad) {
		return assetDao.insertCar(ad);
	}


	@Override
	public AssetDto selectCar(int no) {
		return assetDao.selectCar(no);
	}
	
	
	
	
}