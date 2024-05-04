package spring.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import spring.model.LessonUnitBean;

public class UnitRepository {

	public List<LessonUnitBean> selectLessonUnit(int lessonId) {
		Connection con = ConnectionClass.getConnection();
		LessonUnitBean bean;
		List<LessonUnitBean> lstLessonUnit = new ArrayList<LessonUnitBean>();
		try {
			PreparedStatement ps = con.prepareStatement("select name, unit_name from elearning.unit \r\n"
					+ "join elearning.lesson on elearning.unit.lesson_id = elearning.lesson.id\r\n"
					+ "where lesson_id = ?");
			ps.setInt(1, lessonId);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				bean = new LessonUnitBean();
				bean.setLessonName(rs.getString("name"));
				bean.setUnitName(rs.getString("unit_name"));
				lstLessonUnit.add(bean);
			}

		} catch (SQLException e) {
			System.out.println("Select Lesson Unit: " + e.getMessage());
		}
		return lstLessonUnit;
	}
}
