package spring.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.cglib.proxy.NoOp;
import org.springframework.stereotype.Repository;

import spring.model.LessonUnitBean;
import spring.model.QuizOption;
import spring.model.UniWorkBean;
import spring.model.AddUnitDTO;
import spring.model.UserBean;


public class UnitRepository {

	public List<LessonUnitBean> selectLessonUnit(int lessonId) {
		Connection con = ConnectionClass.getConnection();
		LessonUnitBean bean;
		List<LessonUnitBean> lstLessonUnit = new ArrayList<LessonUnitBean>();
		try {
			PreparedStatement ps = con
					.prepareStatement("select name, unit_name, introduction, unit.id from elearning.unit \r\n"
							+ "join elearning.lesson on elearning.unit.lesson_id = elearning.lesson.id\r\n"
							+ "where lesson_id = ?");
			ps.setInt(1, lessonId);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				bean = new LessonUnitBean();
				bean.setLessonName(rs.getString("name"));
				bean.setUnitName(rs.getString("unit_name"));
				bean.setLessonIntroduction(rs.getString("introduction"));
				bean.setUnitId(rs.getInt("unit.id"));
				lstLessonUnit.add(bean);
			}

		} catch (SQLException e) {
			System.out.println("Select Lesson Unit: " + e.getMessage());
		}
		return lstLessonUnit;
	}

	public UniWorkBean selectUniWork(int unitId) {
		Connection con = ConnectionClass.getConnection();
		UniWorkBean bean = null;

		try {
			PreparedStatement ps = con
					.prepareStatement("select content, workout.question, workout.hint from elearning.unit\r\n"
							+ "join elearning.workout on elearning.unit.id = elearning.workout.unit_id\r\n"
							+ "where elearning.unit.id = ?");
			ps.setInt(1, unitId);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				bean = new UniWorkBean();
				bean.setLessonContent(rs.getString("content"));
				bean.setWorkoutQuestion(rs.getString("workout.question"));
				bean.setWorkoutHint(rs.getString("workout.hint"));
			}
		} catch (SQLException e) {
			System.out.println("Select Unit Workout: " + e.getMessage());
		}
		return bean;
	}

	public boolean insertEnrollment(int userId, int lessonId) {
		Connection con = ConnectionClass.getConnection();
		boolean result = false;
		try {
			PreparedStatement ps = con.prepareStatement(
					"select enrollment.user_id, enrollment.unit_id, enrollment.unit_status from enrollment\r\n"
							+ "join unit on enrollment.unit_id = unit.id\r\n" + "where user_id=? and lesson_id=?;");
			ps.setInt(1, userId);
			ps.setInt(2, lessonId);
			ResultSet rs = ps.executeQuery();

			if (!rs.next()) {
				ps = con.prepareStatement("select unit.id from unit where unit.lesson_id = ?");
				ps.setInt(1, lessonId);
				rs = ps.executeQuery();

				while (rs.next()) {
					ps = con.prepareStatement("insert into elearning.enrollment (user_id, unit_id) values (?, ?)");
					ps.setInt(1, userId);
					ps.setInt(2, rs.getInt("unit.id"));
					result = ps.execute();
				}
			}

		} catch (SQLException e) {
			System.out.println("Insert Enrollment: " + e.getMessage());
		}
		return result;

	}

	public boolean changeProgress(int userId, int unitId) {
		Connection con = ConnectionClass.getConnection();
		boolean result = false;

		try {
			PreparedStatement ps = con.prepareStatement("update elearning.enrollment set unit_status = \"progress\"\r\n"
					+ "where user_id = ? and unit_id = ?");
			ps.setInt(1, userId);
			ps.setInt(2, unitId);
			result = ps.execute();
		} catch (SQLException e) {
			System.out.println("Change Progress: " + e.getMessage());
		}
		return result;
	}

	public List<QuizOption> selectQuiz(int unitId) {
		Connection con = ConnectionClass.getConnection();
		QuizOption bean;
		List<QuizOption> lstQuiz = new ArrayList<QuizOption>();

		try {
			PreparedStatement ps = con.prepareStatement(
					"select unit_name, quiz.id, quiz.question, optionId, selection, is_correct, unit.id from elearning.quiz\r\n"
							+ "join elearning.option on elearning.quiz.id = elearning.option.quiz_id\r\n"
							+ "join elearning.unit on elearning.quiz.unit_id = elearning.unit.id\r\n"
							+ "where elearning.unit.id = ?");
			ps.setInt(1, unitId);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				bean = new QuizOption();
				bean.setUnitName(rs.getString("unit_name"));
				bean.setQuizId(rs.getInt("quiz.id"));
				bean.setQuizQuestion(rs.getString("quiz.question"));
				bean.setOptionId(rs.getInt("optionId"));
				bean.setSelection(rs.getString("selection"));
				bean.setIsCorrect(rs.getInt("is_correct"));
				bean.setUnitId(rs.getInt("unit.id"));
				lstQuiz.add(bean);
			}
		} catch (SQLException e) {
			System.out.println("Select Quiz: " + e.getMessage());
		}
		return lstQuiz;

	}

	public int insertUnit(AddUnitDTO auDTO, int lessonId) {

		Connection con = ConnectionClass.getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		int result = 0;

		try {

			String sqlUnit = "insert into unit(unit_name, lesson_id, content) values(?, ?, ?)";
			ps = con.prepareStatement(sqlUnit, PreparedStatement.RETURN_GENERATED_KEYS);

			ps.setString(1, auDTO.getUnitName());
			ps.setInt(2, lessonId);
			ps.setString(3, auDTO.getContent());
			result += ps.executeUpdate();

			System.out.println("unit table : " + auDTO);

			rs = ps.getGeneratedKeys();
			while (rs.next()) {

				int unitId = rs.getInt(1);
				try {
					String sqlWorkOut = "insert into workout(question, hint, unit_id) values(?, ?, ?)";
					ps = con.prepareStatement(sqlWorkOut);
					ps.setString(1, auDTO.getWorkOut());
					ps.setString(2, auDTO.getHint());
					ps.setInt(3, unitId);

					System.out.println("workout table : " + auDTO + unitId);

					result += ps.executeUpdate();

				} catch (SQLException e) {
					System.out.println("Add workout :" + e.getMessage());
				}

				try {
					String sqlQuiz = "insert into quiz(question, unit_id) values(?, ?)";
					ps = con.prepareStatement(sqlQuiz, PreparedStatement.RETURN_GENERATED_KEYS);
					ps.setString(1, auDTO.getQuiz());
					ps.setInt(2, unitId);

					System.out.println("quiz table : " + auDTO + unitId);

					result += ps.executeUpdate();
				} catch (SQLException e) {
					System.out.println("Add quiz :" + e.getMessage());
				}

				rs = ps.getGeneratedKeys();
				while (rs.next()) {

					int quizId = rs.getInt(1);
					try {
						String sqlOption = "insert into `option`(`option`, is_correct, quiz_id) values(?, ?, ?)";
						ps = con.prepareStatement(sqlOption);

						ps.setString(1, auDTO.getOption1());
//						ps.setBoolean(2, auDTO.getOption1().equals(auDTO.getAnswer()));
						ps.setInt(2, auDTO.getAnswer());
						ps.setInt(3, quizId);

						System.out.println("option table for op1 : " + auDTO + quizId);

						result += ps.executeUpdate();

						ps.setString(1, auDTO.getOption2());
//						ps.setBoolean(2, auDTO.getOption2().equals(auDTO.getAnswer()));
						ps.setInt(2, auDTO.getAnswer());
						ps.setInt(3, quizId);

						System.out.println("option table op2 : " + auDTO.getAnswer() + quizId);

						result += ps.executeUpdate();

					} catch (SQLException e) {
						System.out.println("Add option1 :" + e.getMessage());
					}

				}

			}

		} catch (SQLException e) {
			System.out.println("Add unit :" + e.getMessage());
		}

		System.out.println("total result : " + result);

		return result;

	}

	public List<LessonUnitBean> selectUnitId(int lessonId) {
		Connection con = ConnectionClass.getConnection();
		LessonUnitBean lessonUnitBean;
		List<LessonUnitBean> lstUnitId = new ArrayList<LessonUnitBean>();
		try {
			PreparedStatement ps = con.prepareStatement("select unit.id from unit where unit.lesson_id=?");
			ps.setInt(1, lessonId);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				lessonUnitBean = new LessonUnitBean();
				lessonUnitBean.setUnitId(rs.getInt("unit.id"));
				lstUnitId.add(lessonUnitBean);
			}
		} catch (SQLException e) {
			System.out.println("Select Unit Id: " + e.getMessage());
		}
		return lstUnitId;
	}

	public int changeComplete(int userId, int unitId) {
		Connection con = ConnectionClass.getConnection();
		int result = 0;

		try {
			PreparedStatement ps = con.prepareStatement("update elearning.enrollment set unit_status = \"complete\"\r\n"
					+ "where user_id = ? and unit_id = ?");
			ps.setInt(1, userId);
			ps.setInt(2, unitId);
			result = ps.executeUpdate();
		} catch (SQLException e) {
			System.out.println("Change Progress: " + e.getMessage());
		}
		return result;
	}

}
