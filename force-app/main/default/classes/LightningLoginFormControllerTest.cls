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
}