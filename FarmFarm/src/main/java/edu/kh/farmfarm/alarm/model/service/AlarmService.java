package edu.kh.farmfarm.alarm.model.service;

import java.util.List;
import java.util.Map;

import edu.kh.farmfarm.alarm.model.vo.Alarm;

public interface AlarmService {

	
	/** 알림을 DB에 저장하는 서비스
	 * @param alarm
	 * @return
	 */
	int insertNewAlarm(Alarm alarm);

	/** 게시글 또는 댓글의 작성자를 찾는 서비스
	 * @param type
	 * @param targetNo
	 * @return
	 */
	int selectTargetNo(String type, int inputNo);

	/** 내 알림 목록 조회
	 * @param memberNo
	 * @return
	 */
	List<Alarm> selectAlarmList(int memberNo);
}	
