@IsTest(SeeAllData = true)
public with sharing class LightningLoginFormControllerTest {

 @IsTest
 static void LightningLoginFormControllerInstantiation() {
  LightningLoginFormController controller = new LightningLoginFormController();
  System.assertNotEquals(controller, null);
 }

 @IsTest
 static void testIsUsernamePasswordEnabled() {
  System.assertEquals(true, LightningLoginFormController.getIsUsernamePasswordEnabled());
 }

 @IsTest
 static void testIsSelfRegistrationEnabled() {
  System.assertEquals(false, LightningLoginFormController.getIsSelfRegistrationEnabled());
 }

 @IsTest
 static void testGetSelfRegistrationURL() {
  System.assertEquals(null, LightningLoginFormController.getSelfRegistrationUrl());
 }

 @IsTest
 static void testAuthConfig() {
  Auth.AuthConfiguration authConfig = LightningLoginFormController.getAuthConfig();
  System.assertNotEquals(null, authConfig);
 }

 @IsTest
 static void testLoginSuccess() {
    // Test when login is successful
    String username = 'test@example.com';
    String password = 'testPassword';
    String startUrl = '/home';

    String errorMessage = LightningLoginFormController.login(username, password, startUrl);

    System.assertEquals(null, errorMessage, 'Expected error message to be null');
 }

  /* Verifies that null setExperienceId returns null. */
  @IsTest
  static void testSetExperienceIdAsNull() {
   System.assertEquals(LightningLoginFormController.setExperienceId(null), null);
  }
 
   /* Verifies setExperienceId Exception. */
   @IsTest
   static void testSetExperienceIdException() {
    System.assertNotEquals(LightningLoginFormController.setExperienceId('testText'), null);
   }

   @IsTest
   static void testGetForgotPasswordUrl() {
       // Create test data
       Auth.AuthConfiguration authConfig = new Auth.AuthConfiguration();
       authConfig.ForgotPasswordUrl = 'https://example.com/forgotpassword';
       LightningLoginFormController.setAuthConfig(authConfig); // Assuming you have a method to set AuthConfiguration
       
       // Call the method under test
       Test.startTest();
       String forgotPasswordUrl = LightningLoginFormController.getForgotPasswordUrl();
       Test.stopTest();
       
       // Assert the result
       System.assertEquals('https://example.com/forgotpassword', forgotPasswordUrl, 'Forgot password URL should match configured value');
   }
}
