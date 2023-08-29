package carbon.dto;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
public class Search extends PageDto{
	
	String type;
	String keyword;

}
