package cys.food_order.exceptions;

public class EmailException extends Exception{

	private static final long serialVersionUID = 1L;
private String errorCode="EmailException";

	public EmailException(String message,String error)
	{
		super(message);
	}
	public String getErrorCode()
	{
		return errorCode;
	}
}
