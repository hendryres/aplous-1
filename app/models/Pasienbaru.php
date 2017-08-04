<?php

class Pasienbaru extends \Phalcon\Mvc\Model
{

    /**
     *
     * @var integer
     * @Primary
     * @Identity
     * @Column(type="integer", length=11, nullable=false)
     */
    public $id_pasienbaru;

    /**
     *
     * @var string
     * @Column(type="string", length=50, nullable=true)
     */
    public $fldrm;

    /**
     *
     * @var string
     * @Column(type="string", length=255, nullable=true)
     */
    public $fldnamalengkap;

    /**
     *
     * @var string
     * @Column(type="string", length=255, nullable=true)
     */
    public $fldpendidikan;

    /**
     *
     * @var string
     * @Column(type="string", length=50, nullable=true)
     */
    public $fldgelar;

    /**
     *
     * @var string
     * @Column(type="string", length=255, nullable=true)
     */
    public $fldnamakeluarga;

    /**
     *
     * @var string
     * @Column(type="string", length=255, nullable=true)
     */
    public $fldnamaayah;

    /**
     *
     * @var string
     * @Column(type="string", length=255, nullable=true)
     */
    public $fldnamaibu;

    /**
     *
     * @var string
     * @Column(type="string", length=50, nullable=true)
     */
    public $fldstatuskawin;

    /**
     *
     * @var string
     * @Column(type="string", length=255, nullable=true)
     */
    public $fldnamapasangan;

    /**
     *
     * @var string
     * @Column(type="string", length=50, nullable=true)
     */
    public $fldjeniskelamin;

    /**
     *
     * @var integer
     * @Column(type="integer", length=11, nullable=true)
     */
    public $fldusia;

    /**
     *
     * @var string
     * @Column(type="string", length=100, nullable=true)
     */
    public $fldtempatlahir;

    /**
     *
     * @var string
     * @Column(type="string", nullable=true)
     */
    public $fldalamat;

    /**
     *
     * @var string
     * @Column(type="string", length=100, nullable=true)
     */
    public $fldwilayah;

    /**
     *
     * @var string
     * @Column(type="string", length=100, nullable=true)
     */
    public $fldkabupaten;

    /**
     *
     * @var string
     * @Column(type="string", length=100, nullable=true)
     */
    public $fldkecamatan;

    /**
     *
     * @var integer
     * @Column(type="integer", length=11, nullable=true)
     */
    public $fldkodepos;

    /**
     *
     * @var string
     * @Column(type="string", length=100, nullable=true)
     */
    public $fldsuku;

    /**
     *
     * @var string
     * @Column(type="string", length=100, nullable=true)
     */
    public $fldkebangsaan;

    /**
     *
     * @var string
     * @Column(type="string", length=15, nullable=true)
     */
    public $fldhandphone;

    /**
     *
     * @var string
     * @Column(type="string", length=15, nullable=true)
     */
    public $fldphone;

    /**
     *
     * @var string
     * @Column(type="string", length=20, nullable=true)
     */
    public $fldfax;

    /**
     *
     * @var string
     * @Column(type="string", length=50, nullable=true)
     */
    public $fldemail;

    /**
     *
     * @var string
     * @Column(type="string", length=50, nullable=true)
     */
    public $fldagama;

    /**
     *
     * @var string
     * @Column(type="string", length=100, nullable=true)
     */
    public $fldpekerjaan;

    /**
     *
     * @var string
     * @Column(type="string", nullable=true)
     */
    public $fldalamatbekerja;

    /**
     *
     * @var string
     * @Column(type="string", length=20, nullable=true)
     */
    public $fldphonekantor;

    /**
     *
     * @var string
     * @Column(type="string", length=50, nullable=true)
     */
    public $fldidentitas;

    /**
     *
     * @var string
     * @Column(type="string", length=50, nullable=true)
     */
    public $fldpassport;

    /**
     *
     * @var string
     * @Column(type="string", length=10, nullable=true)
     */
    public $fldgoldarah;

    /**
     *
     * @var string
     * @Column(type="string", length=100, nullable=true)
     */
    public $fldrefferensi;

    /**
     *
     * @var string
     * @Column(type="string", nullable=false)
     */
    public $add_date;

    /**
     * Initialize method for model.
     */
    public function initialize()
    {
        $this->setSchema("aplous_data");
    }

    /**
     * Returns table name mapped in the model.
     *
     * @return string
     */
    public function getSource()
    {
        return 'pasienbaru';
    }

    /**
     * Allows to query a set of records that match the specified conditions
     *
     * @param mixed $parameters
     * @return Pasienbaru[]|Pasienbaru
     */
    public static function find($parameters = null)
    {
        return parent::find($parameters);
    }

    /**
     * Allows to query the first record that match the specified conditions
     *
     * @param mixed $parameters
     * @return Pasienbaru
     */
    public static function findFirst($parameters = null)
    {
        return parent::findFirst($parameters);
    }

}
