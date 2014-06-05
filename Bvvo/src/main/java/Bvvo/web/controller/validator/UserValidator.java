package Bvvo.web.controller.validator;

import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import Bvvo.model.User;

@Component
public class UserValidator implements Validator {

    @Override
    public boolean supports( Class<?> clazz )
    {
        return User.class.isAssignableFrom( clazz );
    }

    @Override
    public void validate( Object target, Errors errors )
    {
        User userslog = (User) target;

        if( !StringUtils.hasText( userslog.getEmail()) )
            errors.rejectValue( "email", "error.user.email.empty" );

        if( !StringUtils.hasText( userslog.getPassword() ) )
            errors.rejectValue( "password", "error.user.password.empty" );
    }

}
