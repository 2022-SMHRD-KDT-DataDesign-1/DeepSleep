package kr.board.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class EditLabel {

	private int id;
	private String img_id;
	private String image_path;
	private String result_path;
	private String result_label;
	private String edit_label;
}

