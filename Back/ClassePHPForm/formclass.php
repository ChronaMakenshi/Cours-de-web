<?php
class Form
{
    protected $code;
    protected $codeinit;
    protected $codetext;
    protected $codesubmit;

    public function __construct($action, $titre, $methode = "post")
    {
        $this->codeinit = "<form action=\"$action\" method=\"$methode\">";
        $this->codeinit .= "<fieldset><legend><b>$titre</b></legend>";
    }
    //***********************************************
    public function setText($name, $libelle, $methode = "post")
    {
        $this->codetext .= "<br><b>$libelle</b><input type=\"text\" name=\"$name\" autocomplete='off' /><br />";
    }
    //************************************************
    public function setSubmit($name = "envoi", $value = "Envoyer")
    {
        $this->codesubmit = "<br><input type=\"submit\" name=\"$name\" value=\"Envoyer\"/>";
    }
    //************************************************
    public function setReset($name = "annuler", $value = "Annuler")
    {
        $this->codereset = "<input type=\"reset\" name=\"$name\" value=\"Annuler\"/>";
    }
    //*************************************************
    public function getForm()
    {
        $this->code = "";
        $this->code .= $this->codeinit;
        $this->code .= $this->codetext;
        $this->code .= $this->codesubmit;
        $this->code .= $this->codereset;
        $this->code .= "</fieldset></form>";
        echo $this->code;
    }

    public static function afficherCommentaire()
    {
        echo "Ce que vous pouvez faire avec des Classes !!!";
    }
}


class Form2 extends Form
{
    protected $coderadio;
    protected $codecase;
    public function __construct($action, $titre, $methode = "post")
    {
        parent::__construct($action, $titre, $methode = "post");
    }

    //********************************************
    public function setRadio($name, $libelle, $value, $checked)
    {
        $this->coderadio .= "<b>$libelle</b><input type=\"radio\" name=\"$name\" $checked value=\"$value\"/>";
    }
    //************************************************
    public function setCase($name, $libelle, $value)
    {
        $this->codecase .= "<br><b>$libelle</b><input type=\"checkbox\" name=\"$name\" value=\"$value\" />";
    }
    //**************************
    public function getForm()
    {
        $this->code = "";
        $this->code .= $this->codeinit;
        $this->code .= $this->codetext;
        $this->code .= $this->coderadio;
        $this->code .= $this->codecase;
        $this->code .= $this->codesubmit;
        $this->code .= $this->codereset;
        $this->code .= "</fieldset></form>";
        echo $this->code;
    }
}

