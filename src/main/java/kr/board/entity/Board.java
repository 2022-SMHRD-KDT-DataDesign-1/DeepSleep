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
	private String image_path;
	private String result_path;
	private String date;
	private int user_idx;
	
}
