import { Page } from "playwright";
import { AdminAppPage } from "./adminAppPage";
import { LoginPage } from "./loginPage";
import { HomePage } from "./homePage";
import { LandingPage } from "./landingPage";
import { FirstTimeSetupPage } from "./firstTimeSetupPage";
import { ProductImprovementPage } from "./productImprovementPage";

export class ModelResolver {
    aaPages: Array<AdminAppPage> = [];

    public get landingPage(): LandingPage {
        let model = this.getModel<LandingPage>(LandingPage.name);
        if (!model) {
            model = new LandingPage(this.page);
            this.aaPages.push(model);
        }
        return model;
    }

    public get loginPage(): LoginPage {
        let model = this.getModel<LoginPage>(LoginPage.name);
        if (!model) {
            model = new LoginPage(this.page);
            this.aaPages.push(model);
        }
        return model;
    }

    public get homePage(): HomePage {
        let model = this.getModel<HomePage>(HomePage.name);
        if (!model) {
            model = new HomePage(this.page);
            this.aaPages.push(model);
        }
        return model;
    }

    public get firstTimeSetupPage(): FirstTimeSetupPage {
        let model = this.getModel<FirstTimeSetupPage>(FirstTimeSetupPage.name);
        if (!model) {
            model = new FirstTimeSetupPage(this.page);
            this.aaPages.push(model);
        }
        return model;
    }

    public get productImprovementPage(): ProductImprovementPage {
        let model = this.getModel<ProductImprovementPage>(ProductImprovementPage.name);
        if (!model) {
            model = new ProductImprovementPage(this.page);
            this.aaPages.push(model);
        }
        return model;
    }

    constructor(public page: Page) {}

    getModel<T extends AdminAppPage>(name: string): T {
        const model = this.aaPages.find((p) => p.constructor.name === name) as T;
        return model;
    }
}
