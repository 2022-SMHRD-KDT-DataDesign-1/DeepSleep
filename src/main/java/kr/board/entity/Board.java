package kr.board.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class Board {

	private int id;
	private String category;
	private String detected_object;
	private String img_id;
	
	private String image_path;
	private String result_path;
	private String date;
	private int user_idx;
	
	private String result_path1;
	private String result_path2;

	private String result_label;
	private String edit_label;
	
	
	private String month;
	private int mnt;
	private String day;
	private int dnt;
}
