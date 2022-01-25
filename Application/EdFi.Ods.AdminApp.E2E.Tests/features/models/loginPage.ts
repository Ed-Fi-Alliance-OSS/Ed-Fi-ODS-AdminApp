import { AdminAppPage } from "./adminAppPage";

export class LoginPage extends AdminAppPage {
    emailInput = "input#Email";
    passwordInput = "input#Password";
    passwordConfirmInput = "input#ConfirmPassword";
    submitBtn = 'button[type="submit"]';
    registerNewUserBtn = "a.btn:text('Register as a new user')";
    registerBtn = 'button[type="submit"]';
    errorMsgSection = "div.validation-summary-errors";

    public errorMessages = {
        missingEmail: "The Email field is required.",
        wrongEmail: "The Email field is not a valid e-mail address.",
        missingPassword: "The Password field is required.",
        invalidLogin: "Invalid login attempt.",
    };

    path(): string {
        return `${this.url}/Identity/Login`;
    }

    needsFirstTimeSetup(): boolean {
        return this.page.url().includes("FirstTimeSetup");
    }

    async fillForm(email?: string, password?: string): Promise<void> {
        await this.fillEmail(email);
        await this.fillPassword(password);
    }

    async fillEmail(email?: string): Promise<void> {
        if (!email) {
            throw "Could not find email. Verify that the variable is set in the .env file";
        }
        await this.page.fill(this.emailInput, email);
    }

    async fillPassword(password?: string): Promise<void> {
        if (!password) {
            throw "Could not find password. Verify that the variable is set in the .env file";
        }
        await this.page.fill(this.passwordInput, password);
    }

    async fillPasswordConfirm(password?: string): Promise<void> {
        if (!password) {
            throw "Could not find password. Verify that the variable is set in the .env file";
        }
        await this.page.fill(this.passwordConfirmInput, password);
    }

    async login(): Promise<void> {
        await this.page.click(this.submitBtn);
    }

    async fullLogin(email?: string, password?: string): Promise<void> {
        await this.navigate();
        await this.fillForm(email, password);
        await this.login();
    }

    async fullRegistration(email?: string, password?: string) {
        await this.startRegistration();
        await this.fillForm(email, password);
        await this.fillPasswordConfirm(password);
        await this.register();
    }

    async hasRegisterButton(): Promise<boolean> {
        return await this.hasText({ text: "Register as a new user", selector: "a.btn" });
    }

    async startRegistration(): Promise<void> {
        await Promise.all([this.clickOnRegisterFromLogin(), this.page.waitForNavigation()]);
    }

    async register(): Promise<void> {
        await this.page.click(this.registerBtn);
    }

    async getErrorMessages(): Promise<string | null> {
        return await this.getText(this.errorMsgSection);
    }

    private async clickOnRegisterFromLogin(): Promise<void> {
        await this.page.click(this.registerNewUserBtn);
    }
}
