/*
 * base_stats.c — Pokémon base stat data for all 151 Pokémon
 */

#include "../include/pokemon.h"
#include "../include/types.h"
#include "../include/moves.h"

extern const void BulbasaurPicFront;
extern const void BulbasaurPicBack;
extern const void IvysaurPicFront;
extern const void IvysaurPicBack;
extern const void VenusaurPicFront;
extern const void VenusaurPicBack;
extern const void CharmanderPicFront;
extern const void CharmanderPicBack;
extern const void CharmeleonPicFront;
extern const void CharmeleonPicBack;
extern const void CharizardPicFront;
extern const void CharizardPicBack;
extern const void SquirtlePicFront;
extern const void SquirtlePicBack;
extern const void WartortlePicFront;
extern const void WartortlePicBack;
extern const void BlastoisePicFront;
extern const void BlastoisePicBack;
extern const void CaterpiePicFront;
extern const void CaterpiePicBack;
extern const void MetapodPicFront;
extern const void MetapodPicBack;
extern const void ButterfreePicFront;
extern const void ButterfreePicBack;
extern const void WeedlePicFront;
extern const void WeedlePicBack;
extern const void KakunaPicFront;
extern const void KakunaPicBack;
extern const void BeedrillPicFront;
extern const void BeedrillPicBack;
extern const void PidgeyPicFront;
extern const void PidgeyPicBack;
extern const void PidgeottoPicFront;
extern const void PidgeottoPicBack;
extern const void PidgeotPicFront;
extern const void PidgeotPicBack;
extern const void RattataPicFront;
extern const void RattataPicBack;
extern const void RaticatePicFront;
extern const void RaticatePicBack;
extern const void SpearowPicFront;
extern const void SpearowPicBack;
extern const void FearowPicFront;
extern const void FearowPicBack;
extern const void EkansPicFront;
extern const void EkansPicBack;
extern const void ArbokPicFront;
extern const void ArbokPicBack;
extern const void PikachuPicFront;
extern const void PikachuPicBack;
extern const void RaichuPicFront;
extern const void RaichuPicBack;
extern const void SandshrewPicFront;
extern const void SandshrewPicBack;
extern const void SandslashPicFront;
extern const void SandslashPicBack;
extern const void NidoranFPicFront;
extern const void NidoranFPicBack;
extern const void NidorinaPicFront;
extern const void NidorinaPicBack;
extern const void NidoqueenPicFront;
extern const void NidoqueenPicBack;
extern const void NidoranMPicFront;
extern const void NidoranMPicBack;
extern const void NidorinoPicFront;
extern const void NidorinoPicBack;
extern const void NidokingPicFront;
extern const void NidokingPicBack;
extern const void ClefairyPicFront;
extern const void ClefairyPicBack;
extern const void ClefablePicFront;
extern const void ClefablePicBack;
extern const void VulpixPicFront;
extern const void VulpixPicBack;
extern const void NinetalesPicFront;
extern const void NinetalesPicBack;
extern const void JigglypuffPicFront;
extern const void JigglypuffPicBack;
extern const void WigglytuffPicFront;
extern const void WigglytuffPicBack;
extern const void ZubatPicFront;
extern const void ZubatPicBack;
extern const void GolbatPicFront;
extern const void GolbatPicBack;
extern const void OddishPicFront;
extern const void OddishPicBack;
extern const void GloomPicFront;
extern const void GloomPicBack;
extern const void VileplumePicFront;
extern const void VileplumePicBack;
extern const void ParasPicFront;
extern const void ParasPicBack;
extern const void ParasectPicFront;
extern const void ParasectPicBack;
extern const void VenonatPicFront;
extern const void VenonatPicBack;
extern const void VenomothPicFront;
extern const void VenomothPicBack;
extern const void DiglettPicFront;
extern const void DiglettPicBack;
extern const void DugtrioPicFront;
extern const void DugtrioPicBack;
extern const void MeowthPicFront;
extern const void MeowthPicBack;
extern const void PersianPicFront;
extern const void PersianPicBack;
extern const void PsyduckPicFront;
extern const void PsyduckPicBack;
extern const void GolduckPicFront;
extern const void GolduckPicBack;
extern const void MankeyPicFront;
extern const void MankeyPicBack;
extern const void PrimeapePicFront;
extern const void PrimeapePicBack;
extern const void GrowlithePicFront;
extern const void GrowlithePicBack;
extern const void ArcaninePicFront;
extern const void ArcaninePicBack;
extern const void PoliwagPicFront;
extern const void PoliwagPicBack;
extern const void PoliwhirlPicFront;
extern const void PoliwhirlPicBack;
extern const void PoliwrathPicFront;
extern const void PoliwrathPicBack;
extern const void AbraPicFront;
extern const void AbraPicBack;
extern const void KadabraPicFront;
extern const void KadabraPicBack;
extern const void AlakazamPicFront;
extern const void AlakazamPicBack;
extern const void MachopPicFront;
extern const void MachopPicBack;
extern const void MachokePicFront;
extern const void MachokePicBack;
extern const void MachampPicFront;
extern const void MachampPicBack;
extern const void BellsproutPicFront;
extern const void BellsproutPicBack;
extern const void WeepinbellPicFront;
extern const void WeepinbellPicBack;
extern const void VictreebelPicFront;
extern const void VictreebelPicBack;
extern const void TentacoolPicFront;
extern const void TentacoolPicBack;
extern const void TentacruelPicFront;
extern const void TentacruelPicBack;
extern const void GeodudePicFront;
extern const void GeodudePicBack;
extern const void GravelerPicFront;
extern const void GravelerPicBack;
extern const void GolemPicFront;
extern const void GolemPicBack;
extern const void PonytaPicFront;
extern const void PonytaPicBack;
extern const void RapidashPicFront;
extern const void RapidashPicBack;
extern const void SlowpokePicFront;
extern const void SlowpokePicBack;
extern const void SlowbroPicFront;
extern const void SlowbroPicBack;
extern const void MagnemitePicFront;
extern const void MagnemitePicBack;
extern const void MagnetonPicFront;
extern const void MagnetonPicBack;
extern const void FarfetchdPicFront;
extern const void FarfetchdPicBack;
extern const void DoduoPicFront;
extern const void DoduoPicBack;
extern const void DodrioPicFront;
extern const void DodrioPicBack;
extern const void SeelPicFront;
extern const void SeelPicBack;
extern const void DewgongPicFront;
extern const void DewgongPicBack;
extern const void GrimerPicFront;
extern const void GrimerPicBack;
extern const void MukPicFront;
extern const void MukPicBack;
extern const void ShellderPicFront;
extern const void ShellderPicBack;
extern const void CloysterPicFront;
extern const void CloysterPicBack;
extern const void GastlyPicFront;
extern const void GastlyPicBack;
extern const void HaunterPicFront;
extern const void HaunterPicBack;
extern const void GengarPicFront;
extern const void GengarPicBack;
extern const void OnixPicFront;
extern const void OnixPicBack;
extern const void DrowzeePicFront;
extern const void DrowzeePicBack;
extern const void HypnoPicFront;
extern const void HypnoPicBack;
extern const void KrabbyPicFront;
extern const void KrabbyPicBack;
extern const void KinglerPicFront;
extern const void KinglerPicBack;
extern const void VoltorbPicFront;
extern const void VoltorbPicBack;
extern const void ElectrodePicFront;
extern const void ElectrodePicBack;
extern const void ExeggcutePicFront;
extern const void ExeggcutePicBack;
extern const void ExeggutorPicFront;
extern const void ExeggutorPicBack;
extern const void CubonePicFront;
extern const void CubonePicBack;
extern const void MarowakPicFront;
extern const void MarowakPicBack;
extern const void HitmonleePicFront;
extern const void HitmonleePicBack;
extern const void HitmonchanPicFront;
extern const void HitmonchanPicBack;
extern const void LickitungPicFront;
extern const void LickitungPicBack;
extern const void KoffingPicFront;
extern const void KoffingPicBack;
extern const void WeezingPicFront;
extern const void WeezingPicBack;
extern const void RhyhornPicFront;
extern const void RhyhornPicBack;
extern const void RhydonPicFront;
extern const void RhydonPicBack;
extern const void ChanseyPicFront;
extern const void ChanseyPicBack;
extern const void TangelaPicFront;
extern const void TangelaPicBack;
extern const void KangaskhanPicFront;
extern const void KangaskhanPicBack;
extern const void HorseaPicFront;
extern const void HorseaPicBack;
extern const void SeadraPicFront;
extern const void SeadraPicBack;
extern const void GoldeenPicFront;
extern const void GoldeenPicBack;
extern const void SeakingPicFront;
extern const void SeakingPicBack;
extern const void StaryuPicFront;
extern const void StaryuPicBack;
extern const void StarmiePicFront;
extern const void StarmiePicBack;
extern const void MrMimePicFront;
extern const void MrMimePicBack;
extern const void ScytherPicFront;
extern const void ScytherPicBack;
extern const void JynxPicFront;
extern const void JynxPicBack;
extern const void ElectabuzzPicFront;
extern const void ElectabuzzPicBack;
extern const void MagmarPicFront;
extern const void MagmarPicBack;
extern const void PinsirPicFront;
extern const void PinsirPicBack;
extern const void TaurosPicFront;
extern const void TaurosPicBack;
extern const void MagikarpPicFront;
extern const void MagikarpPicBack;
extern const void GyaradosPicFront;
extern const void GyaradosPicBack;
extern const void LaprasPicFront;
extern const void LaprasPicBack;
extern const void DittoPicFront;
extern const void DittoPicBack;
extern const void EeveePicFront;
extern const void EeveePicBack;
extern const void VaporeonPicFront;
extern const void VaporeonPicBack;
extern const void JolteonPicFront;
extern const void JolteonPicBack;
extern const void FlareonPicFront;
extern const void FlareonPicBack;
extern const void PorygonPicFront;
extern const void PorygonPicBack;
extern const void OmanytePicFront;
extern const void OmanytePicBack;
extern const void OmastarPicFront;
extern const void OmastarPicBack;
extern const void KabutoPicFront;
extern const void KabutoPicBack;
extern const void KabutopsPicFront;
extern const void KabutopsPicBack;
extern const void AerodactylPicFront;
extern const void AerodactylPicBack;
extern const void SnorlaxPicFront;
extern const void SnorlaxPicBack;
extern const void ArticunoPicFront;
extern const void ArticunoPicBack;
extern const void ZapdosPicFront;
extern const void ZapdosPicBack;
extern const void MoltresPicFront;
extern const void MoltresPicBack;
extern const void DratiniPicFront;
extern const void DratiniPicBack;
extern const void DragonairPicFront;
extern const void DragonairPicBack;
extern const void DragonitePicFront;
extern const void DragonitePicBack;
extern const void MewtwoPicFront;
extern const void MewtwoPicBack;
extern const void MewPicFront;
extern const void MewPicBack;

const BaseStats base_stats[] = {
    { DEX_BULBASAUR, 45, 49, 49, 45, 65, GRASS, POISON, 45, 64, 0x55, &BulbasaurPicFront, &BulbasaurPicBack, TACKLE, GROWL, NO_MOVE, NO_MOVE, GROWTH_MEDIUM_SLOW, { 0xA4, 0x03, 0x38, 0xC0, 0x03, 0x08, 0x06 }, 0 },
    { DEX_IVYSAUR, 60, 62, 63, 60, 80, GRASS, POISON, 45, 141, 0x66, &IvysaurPicFront, &IvysaurPicBack, TACKLE, GROWL, LEECH_SEED, NO_MOVE, GROWTH_MEDIUM_SLOW, { 0xA4, 0x03, 0x38, 0xC0, 0x03, 0x08, 0x06 }, 0 },
    { DEX_VENUSAUR, 80, 82, 83, 80, 100, GRASS, POISON, 45, 208, 0x77, &VenusaurPicFront, &VenusaurPicBack, TACKLE, GROWL, LEECH_SEED, VINE_WHIP, GROWTH_MEDIUM_SLOW, { 0xA4, 0x43, 0x38, 0xC0, 0x03, 0x08, 0x06 }, 0 },
    { DEX_CHARMANDER, 39, 52, 43, 65, 50, FIRE, FIRE, 45, 65, 0x55, &CharmanderPicFront, &CharmanderPicBack, SCRATCH, GROWL, NO_MOVE, NO_MOVE, GROWTH_MEDIUM_SLOW, { 0xB5, 0x03, 0x4F, 0xC8, 0xE3, 0x08, 0x26 }, 0 },
    { DEX_CHARMELEON, 58, 64, 58, 80, 65, FIRE, FIRE, 45, 142, 0x66, &CharmeleonPicFront, &CharmeleonPicBack, SCRATCH, GROWL, EMBER, NO_MOVE, GROWTH_MEDIUM_SLOW, { 0xB5, 0x03, 0x4F, 0xC8, 0xE3, 0x08, 0x26 }, 0 },
    { DEX_CHARIZARD, 78, 84, 78, 100, 85, FIRE, FLYING, 45, 209, 0x77, &CharizardPicFront, &CharizardPicBack, SCRATCH, GROWL, EMBER, LEER, GROWTH_MEDIUM_SLOW, { 0xB5, 0x43, 0x4F, 0xCE, 0xE3, 0x08, 0x26 }, 0 },
    { DEX_SQUIRTLE, 44, 48, 65, 43, 50, WATER, WATER, 45, 66, 0x55, &SquirtlePicFront, &SquirtlePicBack, TACKLE, TAIL_WHIP, NO_MOVE, NO_MOVE, GROWTH_MEDIUM_SLOW, { 0xB1, 0x3F, 0x0F, 0xC8, 0x83, 0x08, 0x32 }, 0 },
    { DEX_WARTORTLE, 59, 63, 80, 58, 65, WATER, WATER, 45, 143, 0x66, &WartortlePicFront, &WartortlePicBack, TACKLE, TAIL_WHIP, BUBBLE, NO_MOVE, GROWTH_MEDIUM_SLOW, { 0xB1, 0x3F, 0x0F, 0xC8, 0x83, 0x08, 0x32 }, 0 },
    { DEX_BLASTOISE, 79, 83, 100, 78, 85, WATER, WATER, 45, 210, 0x77, &BlastoisePicFront, &BlastoisePicBack, TACKLE, TAIL_WHIP, BUBBLE, WATER_GUN, GROWTH_MEDIUM_SLOW, { 0xB1, 0x7F, 0x0F, 0xCE, 0x83, 0x08, 0x32 }, 0 },
    { DEX_CATERPIE, 45, 30, 35, 45, 20, BUG, BUG, 255, 53, 0x55, &CaterpiePicFront, &CaterpiePicBack, TACKLE, STRING_SHOT, NO_MOVE, NO_MOVE, GROWTH_MEDIUM_FAST, { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 }, 0 },
    { DEX_METAPOD, 50, 20, 55, 30, 25, BUG, BUG, 120, 72, 0x55, &MetapodPicFront, &MetapodPicBack, HARDEN, NO_MOVE, NO_MOVE, NO_MOVE, GROWTH_MEDIUM_FAST, { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 }, 0 },
    { DEX_BUTTERFREE, 60, 45, 50, 70, 80, BUG, FLYING, 45, 160, 0x77, &ButterfreePicFront, &ButterfreePicBack, CONFUSION, NO_MOVE, NO_MOVE, NO_MOVE, GROWTH_MEDIUM_FAST, { 0x2A, 0x43, 0x38, 0xF0, 0x43, 0x28, 0x02 }, 0 },
    { DEX_WEEDLE, 40, 35, 30, 50, 20, BUG, POISON, 255, 52, 0x55, &WeedlePicFront, &WeedlePicBack, POISON_STING, STRING_SHOT, NO_MOVE, NO_MOVE, GROWTH_MEDIUM_FAST, { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 }, 0 },
    { DEX_KAKUNA, 45, 25, 50, 35, 25, BUG, POISON, 120, 71, 0x55, &KakunaPicFront, &KakunaPicBack, HARDEN, NO_MOVE, NO_MOVE, NO_MOVE, GROWTH_MEDIUM_FAST, { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 }, 0 },
    { DEX_BEEDRILL, 65, 80, 40, 75, 45, BUG, POISON, 45, 159, 0x77, &BeedrillPicFront, &BeedrillPicBack, FURY_ATTACK, NO_MOVE, NO_MOVE, NO_MOVE, GROWTH_MEDIUM_FAST, { 0x24, 0x43, 0x18, 0xC0, 0xC3, 0x08, 0x06 }, 0 },
    { DEX_PIDGEY, 40, 45, 40, 56, 35, NORMAL, FLYING, 255, 55, 0x55, &PidgeyPicFront, &PidgeyPicBack, GUST, NO_MOVE, NO_MOVE, NO_MOVE, GROWTH_MEDIUM_SLOW, { 0x2A, 0x03, 0x08, 0xC0, 0x43, 0x0C, 0x0A }, 0 },
    { DEX_PIDGEOTTO, 63, 60, 55, 71, 50, NORMAL, FLYING, 120, 113, 0x66, &PidgeottoPicFront, &PidgeottoPicBack, GUST, SAND_ATTACK, NO_MOVE, NO_MOVE, GROWTH_MEDIUM_SLOW, { 0x2A, 0x03, 0x08, 0xC0, 0x43, 0x0C, 0x0A }, 0 },
    { DEX_PIDGEOT, 83, 80, 75, 91, 70, NORMAL, FLYING, 45, 172, 0x77, &PidgeotPicFront, &PidgeotPicBack, GUST, SAND_ATTACK, QUICK_ATTACK, NO_MOVE, GROWTH_MEDIUM_SLOW, { 0x2A, 0x43, 0x08, 0xC0, 0x43, 0x0C, 0x0A }, 0 },
    { DEX_RATTATA, 30, 56, 35, 72, 25, NORMAL, NORMAL, 255, 57, 0x55, &RattataPicFront, &RattataPicBack, TACKLE, TAIL_WHIP, NO_MOVE, NO_MOVE, GROWTH_MEDIUM_FAST, { 0xA0, 0x2F, 0x88, 0xC9, 0xC2, 0x08, 0x02 }, 0 },
    { DEX_RATICATE, 55, 81, 60, 97, 50, NORMAL, NORMAL, 90, 116, 0x66, &RaticatePicFront, &RaticatePicBack, TACKLE, TAIL_WHIP, QUICK_ATTACK, NO_MOVE, GROWTH_MEDIUM_FAST, { 0xA0, 0x7F, 0x88, 0xC9, 0xC2, 0x08, 0x02 }, 0 },
    { DEX_SPEAROW, 40, 60, 30, 70, 31, NORMAL, FLYING, 255, 58, 0x55, &SpearowPicFront, &SpearowPicBack, PECK, GROWL, NO_MOVE, NO_MOVE, GROWTH_MEDIUM_FAST, { 0x2A, 0x03, 0x08, 0xC0, 0x42, 0x0C, 0x0A }, 0 },
    { DEX_FEAROW, 65, 90, 65, 100, 61, NORMAL, FLYING, 90, 162, 0x77, &FearowPicFront, &FearowPicBack, PECK, GROWL, LEER, NO_MOVE, GROWTH_MEDIUM_FAST, { 0x2A, 0x43, 0x08, 0xC0, 0x42, 0x0C, 0x0A }, 0 },
    { DEX_EKANS, 35, 60, 44, 55, 40, POISON, POISON, 255, 62, 0x55, &EkansPicFront, &EkansPicBack, WRAP, LEER, NO_MOVE, NO_MOVE, GROWTH_MEDIUM_FAST, { 0xA0, 0x03, 0x18, 0xCE, 0x82, 0x88, 0x22 }, 0 },
    { DEX_ARBOK, 60, 85, 69, 80, 65, POISON, POISON, 90, 147, 0x77, &ArbokPicFront, &ArbokPicBack, WRAP, LEER, POISON_STING, NO_MOVE, GROWTH_MEDIUM_FAST, { 0xA0, 0x43, 0x18, 0xCE, 0x82, 0x88, 0x22 }, 0 },
    { DEX_PIKACHU, 35, 55, 30, 90, 50, ELECTRIC, ELECTRIC, 190, 82, 0x55, &PikachuPicFront, &PikachuPicBack, THUNDERSHOCK, GROWL, NO_MOVE, NO_MOVE, GROWTH_MEDIUM_FAST, { 0xB1, 0x83, 0x8D, 0xC1, 0xC3, 0x18, 0x42 }, 0 },
    { DEX_RAICHU, 60, 90, 55, 100, 90, ELECTRIC, ELECTRIC, 75, 122, 0x77, &RaichuPicFront, &RaichuPicBack, THUNDERSHOCK, GROWL, THUNDER_WAVE, NO_MOVE, GROWTH_MEDIUM_FAST, { 0xB1, 0xC3, 0x8D, 0xC1, 0xC3, 0x18, 0x42 }, 0 },
    { DEX_SANDSHREW, 50, 75, 85, 40, 30, GROUND, GROUND, 255, 93, 0x55, &SandshrewPicFront, &SandshrewPicBack, SCRATCH, NO_MOVE, NO_MOVE, NO_MOVE, GROWTH_MEDIUM_FAST, { 0xA4, 0x03, 0x0D, 0xCE, 0xC2, 0x88, 0x26 }, 0 },
    { DEX_SANDSLASH, 75, 100, 110, 65, 55, GROUND, GROUND, 90, 163, 0x66, &SandslashPicFront, &SandslashPicBack, SCRATCH, SAND_ATTACK, NO_MOVE, NO_MOVE, GROWTH_MEDIUM_FAST, { 0xA4, 0x43, 0x0D, 0xCE, 0xC2, 0x88, 0x26 }, 0 },
    { DEX_NIDORAN_F, 55, 47, 52, 41, 40, POISON, POISON, 235, 59, 0x55, &NidoranFPicFront, &NidoranFPicBack, GROWL, TACKLE, NO_MOVE, NO_MOVE, GROWTH_MEDIUM_SLOW, { 0xA0, 0x23, 0x88, 0xC1, 0x83, 0x08, 0x02 }, 0 },
    { DEX_NIDORINA, 70, 62, 67, 56, 55, POISON, POISON, 120, 117, 0x66, &NidorinaPicFront, &NidorinaPicBack, GROWL, TACKLE, SCRATCH, NO_MOVE, GROWTH_MEDIUM_SLOW, { 0xE0, 0x3F, 0x88, 0xC1, 0x83, 0x08, 0x02 }, 0 },
    { DEX_NIDOQUEEN, 90, 82, 87, 76, 75, POISON, GROUND, 45, 194, 0x77, &NidoqueenPicFront, &NidoqueenPicBack, TACKLE, SCRATCH, TAIL_WHIP, BODY_SLAM, GROWTH_MEDIUM_SLOW, { 0xF1, 0xFF, 0x8F, 0xC7, 0xA3, 0x88, 0x32 }, 0 },
    { DEX_NIDORAN_M, 46, 57, 40, 50, 40, POISON, POISON, 235, 60, 0x55, &NidoranMPicFront, &NidoranMPicBack, LEER, TACKLE, NO_MOVE, NO_MOVE, GROWTH_MEDIUM_SLOW, { 0xE0, 0x23, 0x88, 0xC1, 0x83, 0x08, 0x02 }, 0 },
    { DEX_NIDORINO, 61, 72, 57, 65, 55, POISON, POISON, 120, 118, 0x66, &NidorinoPicFront, &NidorinoPicBack, LEER, TACKLE, HORN_ATTACK, NO_MOVE, GROWTH_MEDIUM_SLOW, { 0xE0, 0x3F, 0x88, 0xC1, 0x83, 0x08, 0x02 }, 0 },
    { DEX_NIDOKING, 81, 92, 77, 85, 75, POISON, GROUND, 45, 195, 0x77, &NidokingPicFront, &NidokingPicBack, TACKLE, HORN_ATTACK, POISON_STING, THRASH, GROWTH_MEDIUM_SLOW, { 0xF1, 0xFF, 0x8F, 0xC7, 0xA3, 0x88, 0x32 }, 0 },
    { DEX_CLEFAIRY, 70, 45, 48, 35, 60, NORMAL, NORMAL, 150, 68, 0x55, &ClefairyPicFront, &ClefairyPicBack, POUND, GROWL, NO_MOVE, NO_MOVE, GROWTH_FAST, { 0xB1, 0x3F, 0xAF, 0xF1, 0xA7, 0x38, 0x63 }, 0 },
    { DEX_CLEFABLE, 95, 70, 73, 60, 85, NORMAL, NORMAL, 25, 129, 0x66, &ClefablePicFront, &ClefablePicBack, SING, DOUBLESLAP, MINIMIZE, METRONOME, GROWTH_FAST, { 0xB1, 0x7F, 0xAF, 0xF1, 0xA7, 0x38, 0x63 }, 0 },
    { DEX_VULPIX, 38, 41, 40, 65, 65, FIRE, FIRE, 190, 63, 0x66, &VulpixPicFront, &VulpixPicBack, EMBER, TAIL_WHIP, NO_MOVE, NO_MOVE, GROWTH_MEDIUM_FAST, { 0xA0, 0x03, 0x08, 0xC8, 0xE3, 0x08, 0x02 }, 0 },
    { DEX_NINETALES, 73, 76, 75, 100, 100, FIRE, FIRE, 75, 178, 0x77, &NinetalesPicFront, &NinetalesPicBack, EMBER, TAIL_WHIP, QUICK_ATTACK, ROAR, GROWTH_MEDIUM_FAST, { 0xA0, 0x43, 0x08, 0xC8, 0xE3, 0x08, 0x02 }, 0 },
    { DEX_JIGGLYPUFF, 115, 45, 20, 20, 25, NORMAL, NORMAL, 170, 76, 0x55, &JigglypuffPicFront, &JigglypuffPicBack, SING, NO_MOVE, NO_MOVE, NO_MOVE, GROWTH_FAST, { 0xB1, 0x3F, 0xAF, 0xF1, 0xA3, 0x38, 0x63 }, 0 },
    { DEX_WIGGLYTUFF, 140, 70, 45, 45, 50, NORMAL, NORMAL, 50, 109, 0x66, &WigglytuffPicFront, &WigglytuffPicBack, SING, DISABLE, DEFENSE_CURL, DOUBLESLAP, GROWTH_FAST, { 0xB1, 0x7F, 0xAF, 0xF1, 0xA3, 0x38, 0x63 }, 0 },
    { DEX_ZUBAT, 40, 45, 35, 55, 40, POISON, FLYING, 255, 54, 0x55, &ZubatPicFront, &ZubatPicBack, LEECH_LIFE, NO_MOVE, NO_MOVE, NO_MOVE, GROWTH_MEDIUM_FAST, { 0x2A, 0x03, 0x18, 0xC0, 0x42, 0x08, 0x02 }, 0 },
    { DEX_GOLBAT, 75, 80, 70, 90, 75, POISON, FLYING, 90, 171, 0x77, &GolbatPicFront, &GolbatPicBack, LEECH_LIFE, SCREECH, BITE, NO_MOVE, GROWTH_MEDIUM_FAST, { 0x2A, 0x43, 0x18, 0xC0, 0x42, 0x08, 0x02 }, 0 },
    { DEX_ODDISH, 45, 50, 55, 30, 75, GRASS, POISON, 255, 78, 0x55, &OddishPicFront, &OddishPicBack, ABSORB, NO_MOVE, NO_MOVE, NO_MOVE, GROWTH_MEDIUM_SLOW, { 0x24, 0x03, 0x38, 0xC0, 0x03, 0x08, 0x06 }, 0 },
    { DEX_GLOOM, 60, 65, 70, 40, 85, GRASS, POISON, 120, 132, 0x66, &GloomPicFront, &GloomPicBack, ABSORB, POISONPOWDER, STUN_SPORE, NO_MOVE, GROWTH_MEDIUM_SLOW, { 0x24, 0x03, 0x38, 0xC0, 0x03, 0x08, 0x06 }, 0 },
    { DEX_VILEPLUME, 75, 80, 85, 50, 100, GRASS, POISON, 45, 184, 0x77, &VileplumePicFront, &VileplumePicBack, STUN_SPORE, SLEEP_POWDER, ACID, PETAL_DANCE, GROWTH_MEDIUM_SLOW, { 0xA4, 0x43, 0x38, 0xC0, 0x03, 0x08, 0x06 }, 0 },
    { DEX_PARAS, 35, 70, 55, 25, 55, BUG, GRASS, 190, 70, 0x55, &ParasPicFront, &ParasPicBack, SCRATCH, NO_MOVE, NO_MOVE, NO_MOVE, GROWTH_MEDIUM_FAST, { 0xA4, 0x03, 0x38, 0xC8, 0x83, 0x08, 0x06 }, 0 },
    { DEX_PARASECT, 60, 95, 80, 30, 80, BUG, GRASS, 75, 128, 0x77, &ParasectPicFront, &ParasectPicBack, SCRATCH, STUN_SPORE, LEECH_LIFE, NO_MOVE, GROWTH_MEDIUM_FAST, { 0xA4, 0x43, 0x38, 0xC8, 0x83, 0x08, 0x06 }, 0 },
    { DEX_VENONAT, 60, 55, 50, 45, 40, BUG, POISON, 190, 75, 0x55, &VenonatPicFront, &VenonatPicBack, TACKLE, DISABLE, NO_MOVE, NO_MOVE, GROWTH_MEDIUM_FAST, { 0x20, 0x03, 0x38, 0xD0, 0x03, 0x28, 0x02 }, 0 },
    { DEX_VENOMOTH, 70, 65, 60, 90, 90, BUG, POISON, 75, 138, 0x77, &VenomothPicFront, &VenomothPicBack, TACKLE, DISABLE, POISONPOWDER, LEECH_LIFE, GROWTH_MEDIUM_FAST, { 0x2A, 0x43, 0x38, 0xF0, 0x43, 0x28, 0x02 }, 0 },
    { DEX_DIGLETT, 10, 55, 25, 95, 45, GROUND, GROUND, 255, 81, 0x55, &DiglettPicFront, &DiglettPicBack, SCRATCH, NO_MOVE, NO_MOVE, NO_MOVE, GROWTH_MEDIUM_FAST, { 0xA0, 0x03, 0x08, 0xCE, 0x02, 0x88, 0x02 }, 0 },
    { DEX_DUGTRIO, 35, 80, 50, 120, 70, GROUND, GROUND, 50, 153, 0x66, &DugtrioPicFront, &DugtrioPicBack, SCRATCH, GROWL, DIG, NO_MOVE, GROWTH_MEDIUM_FAST, { 0xA0, 0x43, 0x08, 0xCE, 0x02, 0x88, 0x02 }, 0 },
    { DEX_MEOWTH, 40, 45, 35, 90, 40, NORMAL, NORMAL, 255, 69, 0x55, &MeowthPicFront, &MeowthPicBack, SCRATCH, GROWL, NO_MOVE, NO_MOVE, GROWTH_MEDIUM_FAST, { 0xA0, 0x8F, 0x88, 0xC1, 0xC2, 0x08, 0x02 }, 0 },
    { DEX_PERSIAN, 65, 70, 60, 115, 65, NORMAL, NORMAL, 90, 148, 0x77, &PersianPicFront, &PersianPicBack, SCRATCH, GROWL, BITE, SCREECH, GROWTH_MEDIUM_FAST, { 0xA0, 0xCF, 0x88, 0xC1, 0xC2, 0x08, 0x02 }, 0 },
    { DEX_PSYDUCK, 50, 52, 48, 55, 50, WATER, WATER, 190, 80, 0x55, &PsyduckPicFront, &PsyduckPicBack, SCRATCH, NO_MOVE, NO_MOVE, NO_MOVE, GROWTH_MEDIUM_FAST, { 0xB1, 0xBF, 0x0F, 0xC8, 0xC2, 0x08, 0x32 }, 0 },
    { DEX_GOLDUCK, 80, 82, 78, 85, 80, WATER, WATER, 75, 174, 0x77, &GolduckPicFront, &GolduckPicBack, SCRATCH, TAIL_WHIP, DISABLE, NO_MOVE, GROWTH_MEDIUM_FAST, { 0xB1, 0xFF, 0x0F, 0xC8, 0xC2, 0x08, 0x32 }, 0 },
    { DEX_MANKEY, 40, 80, 35, 70, 35, FIGHTING, FIGHTING, 190, 74, 0x55, &MankeyPicFront, &MankeyPicBack, SCRATCH, LEER, NO_MOVE, NO_MOVE, GROWTH_MEDIUM_FAST, { 0xB1, 0x83, 0x8F, 0xC9, 0xC6, 0x88, 0x22 }, 0 },
    { DEX_PRIMEAPE, 65, 105, 60, 95, 60, FIGHTING, FIGHTING, 75, 149, 0x77, &PrimeapePicFront, &PrimeapePicBack, SCRATCH, LEER, KARATE_CHOP, FURY_SWIPES, GROWTH_MEDIUM_FAST, { 0xB1, 0xC3, 0x8F, 0xC9, 0xC6, 0x88, 0x22 }, 0 },
    { DEX_GROWLITHE, 55, 70, 45, 60, 50, FIRE, FIRE, 190, 91, 0x55, &GrowlithePicFront, &GrowlithePicBack, BITE, ROAR, NO_MOVE, NO_MOVE, GROWTH_SLOW, { 0xA0, 0x03, 0x48, 0xC8, 0xE3, 0x08, 0x02 }, 0 },
    { DEX_ARCANINE, 90, 110, 80, 95, 80, FIRE, FIRE, 75, 213, 0x77, &ArcaninePicFront, &ArcaninePicBack, ROAR, EMBER, LEER, TAKE_DOWN, GROWTH_SLOW, { 0xA0, 0x43, 0x48, 0xE8, 0xE3, 0x08, 0x02 }, 0 },
    { DEX_POLIWAG, 40, 50, 40, 90, 40, WATER, WATER, 255, 77, 0x55, &PoliwagPicFront, &PoliwagPicBack, BUBBLE, NO_MOVE, NO_MOVE, NO_MOVE, GROWTH_MEDIUM_SLOW, { 0xA0, 0x3F, 0x08, 0xD0, 0x82, 0x28, 0x12 }, 0 },
    { DEX_POLIWHIRL, 65, 65, 65, 90, 50, WATER, WATER, 120, 131, 0x66, &PoliwhirlPicFront, &PoliwhirlPicBack, BUBBLE, HYPNOSIS, WATER_GUN, NO_MOVE, GROWTH_MEDIUM_SLOW, { 0xB1, 0x3F, 0x0F, 0xD6, 0x86, 0x28, 0x32 }, 0 },
    { DEX_POLIWRATH, 90, 85, 95, 70, 70, WATER, FIGHTING, 45, 185, 0x77, &PoliwrathPicFront, &PoliwrathPicBack, HYPNOSIS, WATER_GUN, DOUBLESLAP, BODY_SLAM, GROWTH_MEDIUM_SLOW, { 0xB1, 0x7F, 0x0F, 0xD6, 0x86, 0x28, 0x32 }, 0 },
    { DEX_ABRA, 25, 20, 15, 90, 105, PSYCHIC_TYPE, PSYCHIC_TYPE, 200, 73, 0x55, &AbraPicFront, &AbraPicBack, TELEPORT, NO_MOVE, NO_MOVE, NO_MOVE, GROWTH_MEDIUM_SLOW, { 0xB1, 0x03, 0x0F, 0xF0, 0x87, 0x38, 0x43 }, 0 },
    { DEX_KADABRA, 40, 35, 30, 105, 120, PSYCHIC_TYPE, PSYCHIC_TYPE, 100, 145, 0x66, &KadabraPicFront, &KadabraPicBack, TELEPORT, CONFUSION, DISABLE, NO_MOVE, GROWTH_MEDIUM_SLOW, { 0xB1, 0x03, 0x0F, 0xF8, 0x87, 0x38, 0x43 }, 0 },
    { DEX_ALAKAZAM, 55, 50, 45, 120, 135, PSYCHIC_TYPE, PSYCHIC_TYPE, 50, 186, 0x77, &AlakazamPicFront, &AlakazamPicBack, TELEPORT, CONFUSION, DISABLE, NO_MOVE, GROWTH_MEDIUM_SLOW, { 0xB1, 0x43, 0x0F, 0xF8, 0x87, 0x38, 0x43 }, 0 },
    { DEX_MACHOP, 70, 80, 50, 35, 35, FIGHTING, FIGHTING, 180, 88, 0x55, &MachopPicFront, &MachopPicBack, KARATE_CHOP, NO_MOVE, NO_MOVE, NO_MOVE, GROWTH_MEDIUM_SLOW, { 0xB1, 0x03, 0x0F, 0xCE, 0xA6, 0x88, 0x22 }, 0 },
    { DEX_MACHOKE, 80, 100, 70, 45, 50, FIGHTING, FIGHTING, 90, 146, 0x77, &MachokePicFront, &MachokePicBack, KARATE_CHOP, LOW_KICK, LEER, NO_MOVE, GROWTH_MEDIUM_SLOW, { 0xB1, 0x03, 0x0F, 0xCE, 0xA6, 0x88, 0x22 }, 0 },
    { DEX_MACHAMP, 90, 130, 80, 55, 65, FIGHTING, FIGHTING, 45, 193, 0x77, &MachampPicFront, &MachampPicBack, KARATE_CHOP, LOW_KICK, LEER, NO_MOVE, GROWTH_MEDIUM_SLOW, { 0xB1, 0x43, 0x0F, 0xCE, 0xA6, 0x88, 0x22 }, 0 },
    { DEX_BELLSPROUT, 50, 75, 35, 40, 70, GRASS, POISON, 255, 84, 0x55, &BellsproutPicFront, &BellsproutPicBack, VINE_WHIP, GROWTH, NO_MOVE, NO_MOVE, GROWTH_MEDIUM_SLOW, { 0x24, 0x03, 0x38, 0xC0, 0x03, 0x08, 0x06 }, 0 },
    { DEX_WEEPINBELL, 65, 90, 50, 55, 85, GRASS, POISON, 120, 151, 0x66, &WeepinbellPicFront, &WeepinbellPicBack, VINE_WHIP, GROWTH, WRAP, NO_MOVE, GROWTH_MEDIUM_SLOW, { 0x24, 0x03, 0x38, 0xC0, 0x03, 0x08, 0x06 }, 0 },
    { DEX_VICTREEBEL, 80, 105, 65, 70, 100, GRASS, POISON, 45, 191, 0x77, &VictreebelPicFront, &VictreebelPicBack, SLEEP_POWDER, STUN_SPORE, ACID, RAZOR_LEAF, GROWTH_MEDIUM_SLOW, { 0xA4, 0x43, 0x38, 0xC0, 0x03, 0x08, 0x06 }, 0 },
    { DEX_TENTACOOL, 40, 40, 35, 70, 100, WATER, POISON, 190, 105, 0x55, &TentacoolPicFront, &TentacoolPicBack, ACID, NO_MOVE, NO_MOVE, NO_MOVE, GROWTH_SLOW, { 0x24, 0x3F, 0x18, 0xC0, 0x83, 0x08, 0x16 }, 0 },
    { DEX_TENTACRUEL, 80, 70, 65, 100, 120, WATER, POISON, 60, 205, 0x66, &TentacruelPicFront, &TentacruelPicBack, ACID, SUPERSONIC, WRAP, NO_MOVE, GROWTH_SLOW, { 0x24, 0x7F, 0x18, 0xC0, 0x83, 0x08, 0x16 }, 0 },
    { DEX_GEODUDE, 40, 80, 100, 20, 30, ROCK, GROUND, 255, 86, 0x55, &GeodudePicFront, &GeodudePicBack, TACKLE, NO_MOVE, NO_MOVE, NO_MOVE, GROWTH_MEDIUM_SLOW, { 0xA1, 0x03, 0x0F, 0xCE, 0x2E, 0xC8, 0x22 }, 0 },
    { DEX_GRAVELER, 55, 95, 115, 35, 45, ROCK, GROUND, 120, 134, 0x66, &GravelerPicFront, &GravelerPicBack, TACKLE, DEFENSE_CURL, NO_MOVE, NO_MOVE, GROWTH_MEDIUM_SLOW, { 0xA1, 0x03, 0x0F, 0xCE, 0x2E, 0xC8, 0x22 }, 0 },
    { DEX_GOLEM, 80, 110, 130, 45, 55, ROCK, GROUND, 45, 177, 0x66, &GolemPicFront, &GolemPicBack, TACKLE, DEFENSE_CURL, NO_MOVE, NO_MOVE, GROWTH_MEDIUM_SLOW, { 0xB1, 0x43, 0x0F, 0xCE, 0x2E, 0xC8, 0x22 }, 0 },
    { DEX_PONYTA, 50, 85, 55, 90, 65, FIRE, FIRE, 190, 152, 0x66, &PonytaPicFront, &PonytaPicBack, EMBER, NO_MOVE, NO_MOVE, NO_MOVE, GROWTH_MEDIUM_FAST, { 0xE0, 0x03, 0x08, 0xC0, 0xE3, 0x08, 0x02 }, 0 },
    { DEX_RAPIDASH, 65, 100, 70, 105, 80, FIRE, FIRE, 60, 192, 0x77, &RapidashPicFront, &RapidashPicBack, EMBER, TAIL_WHIP, STOMP, GROWL, GROWTH_MEDIUM_FAST, { 0xE0, 0x43, 0x08, 0xC0, 0xE3, 0x08, 0x02 }, 0 },
    { DEX_SLOWPOKE, 90, 65, 65, 15, 40, WATER, PSYCHIC_TYPE, 190, 99, 0x55, &SlowpokePicFront, &SlowpokePicBack, CONFUSION, NO_MOVE, NO_MOVE, NO_MOVE, GROWTH_MEDIUM_FAST, { 0xA0, 0xBF, 0x08, 0xFE, 0xE3, 0x38, 0x73 }, 0 },
    { DEX_SLOWBRO, 95, 75, 110, 30, 80, WATER, PSYCHIC_TYPE, 75, 164, 0x77, &SlowbroPicFront, &SlowbroPicBack, CONFUSION, DISABLE, HEADBUTT, NO_MOVE, GROWTH_MEDIUM_FAST, { 0xB1, 0xFF, 0x0F, 0xFE, 0xE3, 0x38, 0x73 }, 0 },
    { DEX_MAGNEMITE, 25, 35, 70, 45, 95, ELECTRIC, ELECTRIC, 190, 89, 0x55, &MagnemitePicFront, &MagnemitePicBack, TACKLE, NO_MOVE, NO_MOVE, NO_MOVE, GROWTH_MEDIUM_FAST, { 0x20, 0x03, 0x88, 0xE1, 0x43, 0x18, 0x42 }, 0 },
    { DEX_MAGNETON, 50, 60, 95, 70, 120, ELECTRIC, ELECTRIC, 60, 161, 0x66, &MagnetonPicFront, &MagnetonPicBack, TACKLE, SONICBOOM, THUNDERSHOCK, NO_MOVE, GROWTH_MEDIUM_FAST, { 0x20, 0x43, 0x88, 0xE1, 0x43, 0x18, 0x42 }, 0 },
    { DEX_FARFETCHD, 52, 65, 55, 60, 58, NORMAL, FLYING, 45, 94, 0x66, &FarfetchdPicFront, &FarfetchdPicBack, PECK, SAND_ATTACK, NO_MOVE, NO_MOVE, GROWTH_MEDIUM_FAST, { 0xAE, 0x03, 0x08, 0xC0, 0xC3, 0x08, 0x0E }, 0 },
    { DEX_DODUO, 35, 85, 45, 75, 35, NORMAL, FLYING, 190, 96, 0x55, &DoduoPicFront, &DoduoPicBack, PECK, NO_MOVE, NO_MOVE, NO_MOVE, GROWTH_MEDIUM_FAST, { 0xA8, 0x03, 0x08, 0xC0, 0x83, 0x0C, 0x0B }, 0 },
    { DEX_DODRIO, 60, 110, 70, 100, 60, NORMAL, FLYING, 45, 158, 0x77, &DodrioPicFront, &DodrioPicBack, PECK, GROWL, FURY_ATTACK, NO_MOVE, GROWTH_MEDIUM_FAST, { 0xA8, 0x43, 0x08, 0xC0, 0x83, 0x0C, 0x0B }, 0 },
    { DEX_SEEL, 65, 45, 55, 45, 70, WATER, WATER, 190, 100, 0x66, &SeelPicFront, &SeelPicBack, HEADBUTT, NO_MOVE, NO_MOVE, NO_MOVE, GROWTH_MEDIUM_FAST, { 0xE0, 0xBF, 0x08, 0xC0, 0x82, 0x08, 0x32 }, 0 },
    { DEX_DEWGONG, 90, 70, 80, 70, 95, WATER, ICE, 75, 176, 0x66, &DewgongPicFront, &DewgongPicBack, HEADBUTT, GROWL, AURORA_BEAM, NO_MOVE, GROWTH_MEDIUM_FAST, { 0xE0, 0xFF, 0x08, 0xC0, 0x82, 0x08, 0x32 }, 0 },
    { DEX_GRIMER, 80, 80, 50, 25, 40, POISON, POISON, 190, 90, 0x55, &GrimerPicFront, &GrimerPicBack, POUND, DISABLE, NO_MOVE, NO_MOVE, GROWTH_MEDIUM_FAST, { 0xA0, 0x00, 0x98, 0xC1, 0x2A, 0x48, 0x02 }, 0 },
    { DEX_MUK, 105, 105, 75, 50, 65, POISON, POISON, 75, 157, 0x77, &MukPicFront, &MukPicBack, POUND, DISABLE, POISON_GAS, NO_MOVE, GROWTH_MEDIUM_FAST, { 0xA0, 0x40, 0x98, 0xC1, 0x2A, 0x48, 0x02 }, 0 },
    { DEX_SHELLDER, 30, 65, 100, 40, 45, WATER, WATER, 190, 97, 0x55, &ShellderPicFront, &ShellderPicBack, TACKLE, WITHDRAW, NO_MOVE, NO_MOVE, GROWTH_SLOW, { 0x20, 0x3F, 0x08, 0xE0, 0x4B, 0x48, 0x13 }, 0 },
    { DEX_CLOYSTER, 50, 95, 180, 70, 85, WATER, ICE, 60, 203, 0x77, &CloysterPicFront, &CloysterPicBack, WITHDRAW, SUPERSONIC, CLAMP, AURORA_BEAM, GROWTH_SLOW, { 0x20, 0x7F, 0x08, 0xE0, 0x4B, 0x48, 0x13 }, 0 },
    { DEX_GASTLY, 30, 35, 30, 80, 100, GHOST, POISON, 190, 95, 0x77, &GastlyPicFront, &GastlyPicBack, LICK, CONFUSE_RAY, NIGHT_SHADE, NO_MOVE, GROWTH_MEDIUM_SLOW, { 0x20, 0x00, 0x98, 0xD1, 0x0A, 0x6A, 0x02 }, 0 },
    { DEX_HAUNTER, 45, 50, 45, 95, 115, GHOST, POISON, 90, 126, 0x66, &HaunterPicFront, &HaunterPicBack, LICK, CONFUSE_RAY, NIGHT_SHADE, NO_MOVE, GROWTH_MEDIUM_SLOW, { 0x20, 0x00, 0x98, 0xD1, 0x0A, 0x6A, 0x02 }, 0 },
    { DEX_GENGAR, 60, 65, 60, 110, 130, GHOST, POISON, 45, 190, 0x66, &GengarPicFront, &GengarPicBack, LICK, CONFUSE_RAY, NIGHT_SHADE, NO_MOVE, GROWTH_MEDIUM_SLOW, { 0xB1, 0x43, 0x9F, 0xD1, 0x8E, 0x6A, 0x22 }, 0 },
    { DEX_ONIX, 35, 45, 160, 70, 30, ROCK, GROUND, 45, 108, 0x77, &OnixPicFront, &OnixPicBack, TACKLE, SCREECH, NO_MOVE, NO_MOVE, GROWTH_MEDIUM_FAST, { 0xA0, 0x03, 0x08, 0xCE, 0x8A, 0xC8, 0x22 }, 0 },
    { DEX_DROWZEE, 60, 48, 45, 42, 90, PSYCHIC_TYPE, PSYCHIC_TYPE, 190, 102, 0x66, &DrowzeePicFront, &DrowzeePicBack, POUND, HYPNOSIS, NO_MOVE, NO_MOVE, GROWTH_MEDIUM_FAST, { 0xB1, 0x03, 0x0F, 0xF0, 0x87, 0x3A, 0x43 }, 0 },
    { DEX_HYPNO, 85, 73, 70, 67, 115, PSYCHIC_TYPE, PSYCHIC_TYPE, 75, 165, 0x77, &HypnoPicFront, &HypnoPicBack, POUND, HYPNOSIS, DISABLE, CONFUSION, GROWTH_MEDIUM_FAST, { 0xB1, 0x43, 0x0F, 0xF0, 0x87, 0x3A, 0x43 }, 0 },
    { DEX_KRABBY, 30, 105, 90, 50, 25, WATER, WATER, 225, 115, 0x55, &KrabbyPicFront, &KrabbyPicBack, BUBBLE, LEER, NO_MOVE, NO_MOVE, GROWTH_MEDIUM_FAST, { 0xA4, 0x3F, 0x08, 0xC0, 0x02, 0x08, 0x36 }, 0 },
    { DEX_KINGLER, 55, 130, 115, 75, 50, WATER, WATER, 60, 206, 0x77, &KinglerPicFront, &KinglerPicBack, BUBBLE, LEER, VICEGRIP, NO_MOVE, GROWTH_MEDIUM_FAST, { 0xA4, 0x7F, 0x08, 0xC0, 0x02, 0x08, 0x36 }, 0 },
    { DEX_VOLTORB, 40, 30, 50, 100, 55, ELECTRIC, ELECTRIC, 190, 103, 0x55, &VoltorbPicFront, &VoltorbPicBack, TACKLE, SCREECH, NO_MOVE, NO_MOVE, GROWTH_MEDIUM_FAST, { 0x20, 0x01, 0x88, 0xE1, 0x4B, 0x58, 0x42 }, 0 },
    { DEX_ELECTRODE, 60, 50, 70, 140, 80, ELECTRIC, ELECTRIC, 60, 150, 0x55, &ElectrodePicFront, &ElectrodePicBack, TACKLE, SCREECH, SONICBOOM, NO_MOVE, GROWTH_MEDIUM_FAST, { 0x20, 0x41, 0x88, 0xE1, 0xCB, 0x58, 0x42 }, 0 },
    { DEX_EXEGGCUTE, 60, 40, 80, 40, 60, GRASS, PSYCHIC_TYPE, 90, 98, 0x77, &ExeggcutePicFront, &ExeggcutePicBack, BARRAGE, HYPNOSIS, NO_MOVE, NO_MOVE, GROWTH_SLOW, { 0x20, 0x03, 0x08, 0xF0, 0x1B, 0x68, 0x02 }, 0 },
    { DEX_EXEGGUTOR, 95, 95, 85, 55, 125, GRASS, PSYCHIC_TYPE, 45, 212, 0x77, &ExeggutorPicFront, &ExeggutorPicBack, BARRAGE, HYPNOSIS, NO_MOVE, NO_MOVE, GROWTH_SLOW, { 0x20, 0x43, 0x38, 0xF0, 0x1B, 0x68, 0x22 }, 0 },
    { DEX_CUBONE, 50, 50, 95, 35, 40, GROUND, GROUND, 190, 87, 0x55, &CubonePicFront, &CubonePicBack, BONE_CLUB, GROWL, NO_MOVE, NO_MOVE, GROWTH_MEDIUM_FAST, { 0xB1, 0x3F, 0x0F, 0xCE, 0xA2, 0x08, 0x22 }, 0 },
    { DEX_MAROWAK, 60, 80, 110, 45, 50, GROUND, GROUND, 75, 124, 0x66, &MarowakPicFront, &MarowakPicBack, BONE_CLUB, GROWL, LEER, FOCUS_ENERGY, GROWTH_MEDIUM_FAST, { 0xB1, 0x7F, 0x0F, 0xCE, 0xA2, 0x08, 0x22 }, 0 },
    { DEX_HITMONLEE, 50, 120, 53, 87, 35, FIGHTING, FIGHTING, 45, 139, 0x77, &HitmonleePicFront, &HitmonleePicBack, DOUBLE_KICK, MEDITATE, NO_MOVE, NO_MOVE, GROWTH_MEDIUM_FAST, { 0xB1, 0x03, 0x0F, 0xC0, 0xC6, 0x08, 0x22 }, 0 },
    { DEX_HITMONCHAN, 50, 105, 79, 76, 35, FIGHTING, FIGHTING, 45, 140, 0x66, &HitmonchanPicFront, &HitmonchanPicBack, COMET_PUNCH, AGILITY, NO_MOVE, NO_MOVE, GROWTH_MEDIUM_FAST, { 0xB1, 0x03, 0x0F, 0xC0, 0xC6, 0x08, 0x22 }, 0 },
    { DEX_LICKITUNG, 90, 55, 75, 30, 60, NORMAL, NORMAL, 45, 127, 0x77, &LickitungPicFront, &LickitungPicBack, WRAP, SUPERSONIC, NO_MOVE, NO_MOVE, GROWTH_MEDIUM_FAST, { 0xB5, 0x7F, 0x8F, 0xC7, 0xA2, 0x08, 0x36 }, 0 },
    { DEX_KOFFING, 40, 65, 95, 35, 60, POISON, POISON, 190, 114, 0x66, &KoffingPicFront, &KoffingPicBack, TACKLE, SMOG, NO_MOVE, NO_MOVE, GROWTH_MEDIUM_FAST, { 0x20, 0x00, 0x88, 0xC1, 0x2A, 0x48, 0x02 }, 0 },
    { DEX_WEEZING, 65, 90, 120, 60, 85, POISON, POISON, 60, 173, 0x77, &WeezingPicFront, &WeezingPicBack, TACKLE, SMOG, SLUDGE, NO_MOVE, GROWTH_MEDIUM_FAST, { 0x20, 0x40, 0x88, 0xC1, 0x2A, 0x48, 0x02 }, 0 },
    { DEX_RHYHORN, 80, 85, 95, 25, 30, GROUND, ROCK, 120, 135, 0x77, &RhyhornPicFront, &RhyhornPicBack, HORN_ATTACK, NO_MOVE, NO_MOVE, NO_MOVE, GROWTH_SLOW, { 0xE0, 0x03, 0x88, 0xCF, 0xA2, 0x88, 0x22 }, 0 },
    { DEX_RHYDON, 105, 130, 120, 40, 45, GROUND, ROCK, 60, 204, 0x77, &RhydonPicFront, &RhydonPicBack, HORN_ATTACK, STOMP, TAIL_WHIP, FURY_ATTACK, GROWTH_SLOW, { 0xF1, 0xFF, 0x8F, 0xCF, 0xA2, 0x88, 0x32 }, 0 },
    { DEX_CHANSEY, 250, 5, 5, 50, 105, NORMAL, NORMAL, 30, 255, 0x66, &ChanseyPicFront, &ChanseyPicBack, POUND, DOUBLESLAP, NO_MOVE, NO_MOVE, GROWTH_FAST, { 0xB1, 0x7F, 0xAF, 0xF1, 0xB7, 0x39, 0x63 }, 0 },
    { DEX_TANGELA, 65, 55, 115, 60, 100, GRASS, GRASS, 45, 166, 0x66, &TangelaPicFront, &TangelaPicBack, CONSTRICT, BIND, NO_MOVE, NO_MOVE, GROWTH_MEDIUM_FAST, { 0xA4, 0x43, 0x38, 0xC0, 0x82, 0x08, 0x06 }, 0 },
    { DEX_KANGASKHAN, 105, 95, 80, 90, 40, NORMAL, NORMAL, 45, 175, 0x77, &KangaskhanPicFront, &KangaskhanPicBack, COMET_PUNCH, RAGE, NO_MOVE, NO_MOVE, GROWTH_MEDIUM_FAST, { 0xB1, 0x7F, 0x8F, 0xC7, 0xA2, 0x88, 0x32 }, 0 },
    { DEX_HORSEA, 30, 40, 70, 60, 70, WATER, WATER, 225, 83, 0x55, &HorseaPicFront, &HorseaPicBack, BUBBLE, NO_MOVE, NO_MOVE, NO_MOVE, GROWTH_MEDIUM_FAST, { 0x20, 0x3F, 0x08, 0xC0, 0xC2, 0x08, 0x12 }, 0 },
    { DEX_SEADRA, 55, 65, 95, 85, 95, WATER, WATER, 75, 155, 0x66, &SeadraPicFront, &SeadraPicBack, BUBBLE, SMOKESCREEN, NO_MOVE, NO_MOVE, GROWTH_MEDIUM_FAST, { 0x20, 0x7F, 0x08, 0xC0, 0xC2, 0x08, 0x12 }, 0 },
    { DEX_GOLDEEN, 45, 67, 60, 63, 50, WATER, WATER, 225, 111, 0x66, &GoldeenPicFront, &GoldeenPicBack, PECK, TAIL_WHIP, NO_MOVE, NO_MOVE, GROWTH_MEDIUM_FAST, { 0x60, 0x3F, 0x08, 0xC0, 0xC2, 0x08, 0x12 }, 0 },
    { DEX_SEAKING, 80, 92, 65, 68, 80, WATER, WATER, 60, 170, 0x77, &SeakingPicFront, &SeakingPicBack, PECK, TAIL_WHIP, SUPERSONIC, NO_MOVE, GROWTH_MEDIUM_FAST, { 0x60, 0x7F, 0x08, 0xC0, 0xC2, 0x08, 0x12 }, 0 },
    { DEX_STARYU, 30, 45, 55, 85, 70, WATER, WATER, 225, 106, 0x66, &StaryuPicFront, &StaryuPicBack, TACKLE, NO_MOVE, NO_MOVE, NO_MOVE, GROWTH_SLOW, { 0x20, 0x3F, 0x88, 0xF1, 0xC3, 0x38, 0x53 }, 0 },
    { DEX_STARMIE, 60, 75, 85, 115, 100, WATER, PSYCHIC_TYPE, 60, 207, 0x66, &StarmiePicFront, &StarmiePicBack, TACKLE, WATER_GUN, HARDEN, NO_MOVE, GROWTH_SLOW, { 0x20, 0x7F, 0x88, 0xF1, 0xC3, 0x38, 0x53 }, 0 },
    { DEX_MR_MIME, 40, 45, 65, 90, 100, PSYCHIC_TYPE, PSYCHIC_TYPE, 45, 136, 0x66, &MrMimePicFront, &MrMimePicBack, CONFUSION, BARRIER, NO_MOVE, NO_MOVE, GROWTH_MEDIUM_FAST, { 0xB1, 0x43, 0xAF, 0xF1, 0x87, 0x38, 0x42 }, 0 },
    { DEX_SCYTHER, 70, 110, 80, 105, 55, BUG, FLYING, 45, 187, 0x77, &ScytherPicFront, &ScytherPicBack, QUICK_ATTACK, NO_MOVE, NO_MOVE, NO_MOVE, GROWTH_MEDIUM_FAST, { 0x24, 0x43, 0x08, 0xC0, 0xC2, 0x08, 0x06 }, 0 },
    { DEX_JYNX, 65, 50, 35, 95, 95, ICE, PSYCHIC_TYPE, 45, 137, 0x66, &JynxPicFront, &JynxPicBack, POUND, LOVELY_KISS, NO_MOVE, NO_MOVE, GROWTH_MEDIUM_FAST, { 0xB1, 0x7F, 0x0F, 0xF0, 0x87, 0x28, 0x02 }, 0 },
    { DEX_ELECTABUZZ, 65, 83, 57, 105, 85, ELECTRIC, ELECTRIC, 45, 156, 0x66, &ElectabuzzPicFront, &ElectabuzzPicBack, QUICK_ATTACK, LEER, NO_MOVE, NO_MOVE, GROWTH_MEDIUM_FAST, { 0xB1, 0x43, 0x8F, 0xF1, 0xC7, 0x38, 0x62 }, 0 },
    { DEX_MAGMAR, 65, 95, 57, 93, 85, FIRE, FIRE, 45, 167, 0x66, &MagmarPicFront, &MagmarPicBack, EMBER, NO_MOVE, NO_MOVE, NO_MOVE, GROWTH_MEDIUM_FAST, { 0xB1, 0x43, 0x0F, 0xF0, 0xA6, 0x28, 0x22 }, 0 },
    { DEX_PINSIR, 65, 125, 100, 85, 55, BUG, BUG, 45, 200, 0x77, &PinsirPicFront, &PinsirPicBack, VICEGRIP, NO_MOVE, NO_MOVE, NO_MOVE, GROWTH_SLOW, { 0xA4, 0x43, 0x0D, 0xC0, 0x02, 0x08, 0x26 }, 0 },
    { DEX_TAUROS, 75, 100, 95, 110, 70, NORMAL, NORMAL, 45, 211, 0x77, &TaurosPicFront, &TaurosPicBack, TACKLE, NO_MOVE, NO_MOVE, NO_MOVE, GROWTH_SLOW, { 0xE0, 0x73, 0x88, 0xC7, 0xA2, 0x08, 0x22 }, 0 },
    { DEX_MAGIKARP, 20, 10, 55, 80, 20, WATER, WATER, 255, 20, 0x66, &MagikarpPicFront, &MagikarpPicBack, SPLASH, NO_MOVE, NO_MOVE, NO_MOVE, GROWTH_SLOW, { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 }, 0 },
    { DEX_GYARADOS, 95, 125, 79, 81, 100, WATER, FLYING, 45, 214, 0x77, &GyaradosPicFront, &GyaradosPicBack, BITE, DRAGON_RAGE, LEER, HYDRO_PUMP, GROWTH_SLOW, { 0xA0, 0x7F, 0xC8, 0xC1, 0xA3, 0x08, 0x32 }, 0 },
    { DEX_LAPRAS, 130, 85, 80, 60, 95, WATER, ICE, 45, 219, 0x77, &LaprasPicFront, &LaprasPicBack, WATER_GUN, GROWL, NO_MOVE, NO_MOVE, GROWTH_SLOW, { 0xE0, 0x7F, 0xE8, 0xD1, 0x83, 0x28, 0x32 }, 0 },
    { DEX_DITTO, 48, 48, 48, 48, 48, NORMAL, NORMAL, 35, 61, 0x55, &DittoPicFront, &DittoPicBack, TRANSFORM, NO_MOVE, NO_MOVE, NO_MOVE, GROWTH_MEDIUM_FAST, { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 }, 0 },
    { DEX_EEVEE, 55, 55, 50, 55, 65, NORMAL, NORMAL, 45, 92, 0x55, &EeveePicFront, &EeveePicBack, TACKLE, SAND_ATTACK, NO_MOVE, NO_MOVE, GROWTH_MEDIUM_FAST, { 0xA0, 0x03, 0x08, 0xC0, 0xC3, 0x08, 0x02 }, 0 },
    { DEX_VAPOREON, 130, 65, 60, 65, 110, WATER, WATER, 45, 196, 0x66, &VaporeonPicFront, &VaporeonPicBack, TACKLE, SAND_ATTACK, QUICK_ATTACK, WATER_GUN, GROWTH_MEDIUM_FAST, { 0xA0, 0x7F, 0x08, 0xC0, 0xC3, 0x08, 0x12 }, 0 },
    { DEX_JOLTEON, 65, 65, 60, 130, 110, ELECTRIC, ELECTRIC, 45, 197, 0x66, &JolteonPicFront, &JolteonPicBack, TACKLE, SAND_ATTACK, QUICK_ATTACK, THUNDERSHOCK, GROWTH_MEDIUM_FAST, { 0xA0, 0x43, 0x88, 0xC1, 0xC3, 0x18, 0x42 }, 0 },
    { DEX_FLAREON, 65, 130, 60, 65, 110, FIRE, FIRE, 45, 198, 0x66, &FlareonPicFront, &FlareonPicBack, TACKLE, SAND_ATTACK, QUICK_ATTACK, EMBER, GROWTH_MEDIUM_FAST, { 0xA0, 0x43, 0x08, 0xC0, 0xE3, 0x08, 0x02 }, 0 },
    { DEX_PORYGON, 65, 60, 70, 40, 75, NORMAL, NORMAL, 45, 130, 0x66, &PorygonPicFront, &PorygonPicBack, TACKLE, SHARPEN, CONVERSION, NO_MOVE, GROWTH_MEDIUM_FAST, { 0x20, 0x73, 0x88, 0xF1, 0xC3, 0x38, 0x43 }, 0 },
    { DEX_OMANYTE, 35, 40, 100, 35, 90, ROCK, WATER, 45, 120, 0x55, &OmanytePicFront, &OmanytePicBack, WATER_GUN, WITHDRAW, NO_MOVE, NO_MOVE, GROWTH_MEDIUM_FAST, { 0xA0, 0x3F, 0x08, 0xC0, 0x03, 0x08, 0x12 }, 0 },
    { DEX_OMASTAR, 70, 60, 125, 55, 115, ROCK, WATER, 45, 199, 0x66, &OmastarPicFront, &OmastarPicBack, WATER_GUN, WITHDRAW, HORN_ATTACK, NO_MOVE, GROWTH_MEDIUM_FAST, { 0xE0, 0x7F, 0x0D, 0xC0, 0x83, 0x08, 0x12 }, 0 },
    { DEX_KABUTO, 30, 80, 90, 55, 45, ROCK, WATER, 45, 119, 0x55, &KabutoPicFront, &KabutoPicBack, SCRATCH, HARDEN, NO_MOVE, NO_MOVE, GROWTH_MEDIUM_FAST, { 0xA0, 0x3F, 0x08, 0xC0, 0x03, 0x08, 0x12 }, 0 },
    { DEX_KABUTOPS, 60, 115, 105, 80, 70, ROCK, WATER, 45, 201, 0x66, &KabutopsPicFront, &KabutopsPicBack, SCRATCH, HARDEN, ABSORB, NO_MOVE, GROWTH_MEDIUM_FAST, { 0xB6, 0x7F, 0x0D, 0xC0, 0x83, 0x08, 0x12 }, 0 },
    { DEX_AERODACTYL, 80, 105, 65, 130, 60, ROCK, FLYING, 45, 202, 0x77, &AerodactylPicFront, &AerodactylPicBack, WING_ATTACK, AGILITY, NO_MOVE, NO_MOVE, GROWTH_SLOW, { 0x2A, 0x43, 0x48, 0xC0, 0x63, 0x0C, 0x0A }, 0 },
    { DEX_SNORLAX, 160, 110, 65, 30, 65, NORMAL, NORMAL, 25, 154, 0x77, &SnorlaxPicFront, &SnorlaxPicBack, HEADBUTT, AMNESIA, REST, NO_MOVE, GROWTH_SLOW, { 0xB1, 0xFF, 0xAF, 0xD7, 0xAF, 0xA8, 0x32 }, 0 },
    { DEX_ARTICUNO, 90, 85, 100, 85, 125, ICE, FLYING, 3, 215, 0x77, &ArticunoPicFront, &ArticunoPicBack, PECK, ICE_BEAM, NO_MOVE, NO_MOVE, GROWTH_SLOW, { 0x2A, 0x7F, 0x08, 0xC0, 0x43, 0x0C, 0x0A }, 0 },
    { DEX_ZAPDOS, 90, 90, 85, 100, 125, ELECTRIC, FLYING, 3, 216, 0x77, &ZapdosPicFront, &ZapdosPicBack, THUNDERSHOCK, DRILL_PECK, NO_MOVE, NO_MOVE, GROWTH_SLOW, { 0x2A, 0x43, 0x88, 0xC1, 0x43, 0x1C, 0x4A }, 0 },
    { DEX_MOLTRES, 90, 100, 90, 90, 125, FIRE, FLYING, 3, 217, 0x77, &MoltresPicFront, &MoltresPicBack, PECK, FIRE_SPIN, NO_MOVE, NO_MOVE, GROWTH_SLOW, { 0x2A, 0x43, 0x08, 0xC0, 0x63, 0x0C, 0x0A }, 0 },
    { DEX_DRATINI, 41, 64, 45, 50, 50, DRAGON, DRAGON, 45, 67, 0x55, &DratiniPicFront, &DratiniPicBack, WRAP, LEER, NO_MOVE, NO_MOVE, GROWTH_SLOW, { 0xA0, 0x3F, 0xC8, 0xC1, 0xE3, 0x18, 0x12 }, 0 },
    { DEX_DRAGONAIR, 61, 84, 65, 70, 70, DRAGON, DRAGON, 45, 144, 0x66, &DragonairPicFront, &DragonairPicBack, WRAP, LEER, THUNDER_WAVE, NO_MOVE, GROWTH_SLOW, { 0xE0, 0x3F, 0xC8, 0xC1, 0xE3, 0x18, 0x12 }, 0 },
    { DEX_DRAGONITE, 91, 134, 95, 80, 100, DRAGON, FLYING, 45, 218, 0x77, &DragonitePicFront, &DragonitePicBack, WRAP, LEER, THUNDER_WAVE, AGILITY, GROWTH_SLOW, { 0xE2, 0x7F, 0xC8, 0xC1, 0xE3, 0x18, 0x32 }, 0 },
    { DEX_MEWTWO, 106, 110, 90, 130, 154, PSYCHIC_TYPE, PSYCHIC_TYPE, 3, 220, 0x77, &MewtwoPicFront, &MewtwoPicBack, CONFUSION, DISABLE, SWIFT, PSYCHIC_M, GROWTH_SLOW, { 0xB1, 0xFF, 0xAF, 0xF1, 0xAF, 0x38, 0x63 }, 0 }
};

